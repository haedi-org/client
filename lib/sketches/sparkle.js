var sparkle_sketch = function(p) {
    p.CANVAS_SIZE = 80;
    p.SCALE_FACTOR = 0.5;
    p.BKG_CLR = "#FFFFFF";
    p.blue_svg;
    p.pink_svg;
    p.green_svg;
    p.blue_sparkle;
    p.pink_sparkle;
    p.green_sparkle;

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
        //                                           X   Y   W   H    A
        p.blue_sparkle  = new p.Sparkle( p.blue_svg,  8, 10, 82, 145, 0);
        p.pink_sparkle  = new p.Sparkle( p.pink_svg, 48,  6, 54,  96, 1.5);
        p.green_sparkle = new p.Sparkle(p.green_svg, 36, 48, 48,  86, 3);
    }

    p.draw = function() {
        p.background(p.BKG_CLR);
        p.blue_sparkle.update();
        p.pink_sparkle.update();
        p.green_sparkle.update();
        p.blue_sparkle.show();
        p.pink_sparkle.show();
        p.green_sparkle.show();
    }
}

var sparkle_p5 = new p5(sparkle_sketch);