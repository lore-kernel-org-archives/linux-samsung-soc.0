From: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: Re: [PATCH RESEND v3] ARM: s3c2442: Setup gpio {set,
	get}_pull callbacks
Date: Tue, 30 Nov 2010 14:01:43 +0200
Message-ID: <201011301401.44973.anarsoul@gmail.com>
References: <000201cb8fae$4d61fd20$e825f760$%kim@samsung.com>
	<001801cb9056$65296530$2f7c2f90$%kim@samsung.com>
	<4CF4E5C7.5020600@metafoo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <4CF4E5C7.5020600@metafoo.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Lars-Peter Clausen <lars@metafoo.de>
Cc: linux-samsung-soc@vger.kernel.org, 'Russell King' <linux@arm.linux.org.uk>, Kukjin Kim <kgene.kim@samsung.com>, 'Ben Dooks' <ben-linux@fluff.org>, 'Abdoulaye Walsimou GAYE' <awg@embtoolkit.org>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On Tuesday 30 November 2010 13:53:43 Lars-Peter Clausen wrote:

> > Hmm...how about s3c_gpio_setpull_1updown(...)?
> > And actually, not used 3rd argument, "pull" now.
> > I prefer follwoing.
> 
> You need the 4th arguemnt, because the s3c2440 only supports pullups and
> the s3c2442 only supports pulldowns. So you want to return -EINVAL if
> somebody tries to set a pullup on a s3c2442 based board.
> Your proposed solution would return 0 and set a pulldown instead.

Well, at least it allows single-binary kernel for s3c24xx to exist. I think 
it's OK, as setting pull{up,down} bit for any non S3C_GPIO_PULL_NONE arg 
preserves semantics for all SoCs (s3c2410/s3c2440/s3c2442) by cost of not 
handling errors. Anyway, who wants to call cfgpull with S3C_GPIO_PULL_DOWN on 
s3c2410/s3c2440 or with S3C_GPIO_PULL_UP on s3c2442?
 
Regards
Vasily
