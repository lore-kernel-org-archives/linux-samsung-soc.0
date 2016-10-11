From: Sergio Prado <sergio.prado@e-labworks.com>
Subject: Re: [PATCH 3/3] mtd: s3c2410: parse the device configuration from OF
 node
Date: Mon, 10 Oct 2016 22:31:04 -0300
Message-ID: <20161011013104.GA10064@sprado-desktop>
References: <1475711217-974-1-git-send-email-sergio.prado@e-labworks.com>
 <1475711217-974-4-git-send-email-sergio.prado@e-labworks.com>
 <20161007162810.GB4222@kozik-lap>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20161007162810.GB4222@kozik-lap>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux@armlinux.org.uk, linux@simtec.co.uk, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, kgene@kernel.org, javier@osg.samsung.com, boris.brezillon@free-electrons.com, richard@nod.at, dwmw2@infradead.org, computersforpeace@gmail.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Oct 07, 2016 at 07:28:10PM +0300, Krzysztof Kozlowski wrote:

> > +struct s3c24XX_nand_devtype_data {
> > +	enum s3c_cpu_type type;
> > +};
> > +
> > +struct s3c24XX_nand_devtype_data s3c2410_nand_devtype_data = {
> > +	.type = TYPE_S3C2410,
> > +};
> > +
> > +struct s3c24XX_nand_devtype_data s3c2412_nand_devtype_data = {
> > +	.type = TYPE_S3C2412,
> > +};
> > +
> > +struct s3c24XX_nand_devtype_data s3c2440_nand_devtype_data = {
> > +	.type = TYPE_S3C2440,
> > +};
> > +
> > +struct s3c24XX_nand_devtype_data s3c6400_nand_devtype_data = {
> > +	.type = TYPE_S3C2412,
> 
> All of these look like candidate for static const.
> 
> Additionally you are not actually differentiating between s3c2412 and
> s3c64xx so I think there is not need of samsung,s3c6400-nand compatible.
> Just use existing one.
> 
> Best regards,
> Krzysztof

You are right. I'll review and send V2.

Best regards,

Sergio Prado
