var atom_sketch = function(p) {
    p.CANVAS_SIZE = 320;
    p.SPACING = 20;
    p.DIAMETER = 8;
    p.BKG_CLR = "#FFFFFF";
    p.FRG_CLR = "#DBDBDB";
    p.FILL_ELECTRONS = false;
    
    p.orbits = [];
    
    p.Orbit = class {
        constructor(r, n) {
            this.r = r * p.SPACING;
            this.n = n;
            this.d = p.DIAMETER;
            this.offset = -p.HALF_PI;
            this.speed = (r % 2 == 1) ? p.random(0.01) : -p.random(0.01);
        }
    
        update() {
            this.offset += this.speed;
        }
    
        show() {
            p.noFill();
            p.stroke(p.FRG_CLR);
            // Ring
            p.circle(0, 0, this.r * 2);
            // Electrons
            p.fill(p.FILL_ELECTRONS ? p.FRG_CLR : p.BKG_CLR);
            for(let i = 0; i < this.n; i++) {
                let x = this.r * p.cos(i * (p.TWO_PI / this.n) + this.offset);
                let y = this.r * p.sin(i * (p.TWO_PI / this.n) + this.offset);
                p.circle(x, y, this.d);
            }
        }
    }
    
    p.setup = function() {
        // Set canvas
        canvas = p.createCanvas(p.CANVAS_SIZE, p.CANVAS_SIZE);
        canvas.parent('anim');
        //noLoop();
        // Set orbits for [Au]
        p.orbits.push(new p.Orbit(1, 2));
        p.orbits.push(new p.Orbit(2, 8));
        p.orbits.push(new p.Orbit(3, 18));
        p.orbits.push(new p.Orbit(4, 32));
        p.orbits.push(new p.Orbit(5, 18));
        p.orbits.push(new p.Orbit(6, 1));
    }
    
    p.draw = function() {
        p.background(p.BKG_CLR);
        p.translate(p.width / 2, p.height / 2);
        for (let i = 0; i < p.orbits.length; i++) {
            p.orbits[i].show();
            p.orbits[i].update();
        }
    }
}


var atom_p5 = new p5(atom_sketch);