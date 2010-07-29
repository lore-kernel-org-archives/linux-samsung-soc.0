From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 3/3] rtc: rtc-s3c: Add BCD register initialization codes
Date: Thu, 29 Jul 2010 10:55:25 +0900
Message-ID: <007701cb2ec1$1fe5a2a0$5fb0e7e0$%kim@samsung.com>
References: <1279702666-13021-1-git-send-email-kgene.kim@samsung.com>
	<1279702666-13021-4-git-send-email-kgene.kim@samsung.com>
	<4C50744C.6010501@simtec.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <4C50744C.6010501@simtec.co.uk>
Content-language: ko
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: 'Ben Dooks' <ben@simtec.co.uk>
Cc: p_gortmaker@yahoo.com, linux-samsung-soc@vger.kernel.org, rtc-linux@googlegroups.com, a.zummo@towertech.it, 'Taekgyun Ko' <taeggyun.ko@samsung.com>, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Ben Dooks wrote:
> 
> On 21/07/10 09:57, Kukjin Kim wrote:
> > From: Taekgyun Ko <taeggyun.ko@samsung.com>
> >
> > RTC needs to be initialized when BCD registers have invalid value.
> >
> > Signed-off-by: Taekgyun Ko <taeggyun.ko@samsung.com>
> > Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> > ---
> >  drivers/rtc/rtc-s3c.c |   14 ++++++++++++--
> >  1 files changed, 12 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
> > index 2040017..e96e109 100644
> > --- a/drivers/rtc/rtc-s3c.c
> > +++ b/drivers/rtc/rtc-s3c.c
> > @@ -536,10 +536,20 @@ static int __devinit s3c_rtc_probe(struct
> platform_device *pdev)
> >
> >  	s3c_rtc_cpu_type = platform_get_device_id(pdev)->driver_data;
> >
> > -	if (s3c_rtc_cpu_type == TYPE_S3C64XX)
> > +	if (s3c_rtc_cpu_type == TYPE_S3C64XX) {
> >  		rtc->max_user_freq = 32768;
> > -	else
> > +
> > +		/* Check RTC Time */
> > +
> > +		for (i = S3C2410_RTCSEC; i <= S3C2410_RTCYEAR; i += 0x4) {
> > +			tmp = readb(s3c_rtc_base + i);
> > +
> > +			if (((tmp & 0xf) > 0x9) || (((tmp >> 4) & 0xf) >
0x9))
> > +				writeb(0, s3c_rtc_base + i);
> 
> This is something we should probably do for all SoCs.

Yeah...ok...will move it.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
