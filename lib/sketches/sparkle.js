var sparkle_sketch = function(p) {
    p.CANVAS_SIZE = 80;
    p.SCALE_FACTOR = 0.5;
    p.BKG_CLR = "#FFFFFF";
    p.blue_svg;
    p.pink_svg;
    p.green_svg;
    p.sparkles = [];

    p.Sparkle = class {
        constructor(img, x, y, w, h, period_offset) {
            this.img = img;
            this.w = w * 0.4;
            this.h = h * 0.4;
            this.x = x + (this.w / 2);
            this.y = y + (this.h / 2);
            this.a = period_offset;
        }

        update() {
            this.a += 0.1;
        }

        show() {
            p.image(
                this.img, 
                p.SCALE_FACTOR * this.x, 
                p.SCALE_FACTOR * this.y,
                p.SCALE_FACTOR * this.w * (1 + (0.1 * p.sin(this.a))),
                p.SCALE_FACTOR * this.h * (1 + (0.1 * p.sin(this.a)))
            );
        }
    }

    p.preload = function() {
        p.blue_svg  = p.loadImage("../assets/sparkle_blue.svg");
        p.pink_svg  = p.loadImage("../assets/sparkle_pink.svg");
        p.green_svg = p.loadImage("../assets/sparkle_green.svg");
    }

    p.setup = function() {
        // Set canvas
        canvas = p.createCanvas(
            p.CANVAS_SIZE * p.SCALE_FACTOR, 
            p.CANVAS_SIZE * p.SCALE_FACTOR
        );
        canvas.parent('anim-logo');
        console.log(canvas);
        p.angleMode(p.RADIANS);
        p.imageMode(p.CENTER);
        //                                    IMG   X   Y   W    H    A
        p.sparkles.push(new p.Sparkle( p.blue_svg,  8,  8, 82, 145,   0));
        p.sparkles.push(new p.Sparkle( p.pink_svg, 48,  4, 54,  96, 1.5));
        p.sparkles.push(new p.Sparkle(p.green_svg, 36, 48, 48,  86,   3));
    }

    p.draw = function() {
        p.background(p.BKG_CLR);
        for (let sparkle of p.sparkles) {
            sparkle.update();
            sparkle.show();
        }
    }
}

var sparkle_p5 = new p5(sparkle_sketch);