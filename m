From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH 3/3] ARM: S3C24XX: handle s3c2412 eints using new
 infrastructure
Date: Sat, 02 Mar 2013 20:10:04 +0000
Message-ID: <20130302201004.95D033E20E9@localhost>
References: <201302120102.03511.heiko@sntech.de>
 <201302120105.45608.heiko@sntech.de>
 <CACRpkdZ5dxyXhrNUJDEzPoDOGRn_50ZuaHW4ZpguSyApQvh7hw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6746211438772250787=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CACRpkdZ5dxyXhrNUJDEzPoDOGRn_50ZuaHW4ZpguSyApQvh7hw@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>, Thomas Abraham <thomas.abraham@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

--===============6746211438772250787==
Content-Type: text/plain

On Fri, 15 Feb 2013 15:48:52 +0100, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Tue, Feb 12, 2013 at 1:05 AM, Heiko Stübner <heiko@sntech.de> wrote:
> 
> > The s3c2412 handles the eints 0 to 3 different than all the other SoCs
> > of the 24xx range. These eints must be acked and masked in the regular
> > bits as well as the bits 0 to 3 of the eint registers, which are unused
> > on the other SoCs.
> >
> > This of course can be realized using the new infrastructure with the
> > eint bits in the main register being the parent interrupts of the
> > same bits in the eint register.
> >
> > The s3c2412 therefore gets its own IRQ_EINT0 to 4 constants that
> > reside in the newly created gap before IRQ_EINT4. gpio-samsung, as the
> > only user of these is modified to return the correct values when
> > handling gpio_to_irq requests on s3c2412 based machines.
> >
> > Due to lack of hardware this is compile tested only, but should
> > hopefully work as intended.
> >
> > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> 
> We definately need an ACK from some Samsung maintainer for
> this patch...

Pish, I'm not taking this. It's all arch/arm code with a 6 line
drivers/gpio change. Instead:

Acked-by: Grant Likely <grant.likely@secretlab.ca>

g.


--===============6746211438772250787==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============6746211438772250787==--
