From: Mike Turquette <mturquette@linaro.org>
Subject: Re: RE: [PATCH v6 00/16] clk: exynos4/5: migrate to common clock framework
Date: Tue, 19 Mar 2013 19:56:56 -0700
Message-ID: <20130320025656.11073.90469@quantum>
References: <1361175686-19400-1-git-send-email-thomas.abraham@linaro.org>
 <20130319184938.8663.18115@quantum> <201303192212.16877.heiko@sntech.de>
 <20130319215038.8663.83548@quantum>
 <116a01ce24fd$e32658b0$a9730a10$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-da0-f53.google.com ([209.85.210.53]:54965 "EHLO
	mail-da0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750968Ab3CTC5G convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 19 Mar 2013 22:57:06 -0400
Received: by mail-da0-f53.google.com with SMTP id n34so682844dal.40
        for <linux-samsung-soc@vger.kernel.org>; Tue, 19 Mar 2013 19:57:05 -0700 (PDT)
In-Reply-To: <116a01ce24fd$e32658b0$a9730a10$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, =?utf-8?q?=27Heiko_St=C3=BCbner=27?= <heiko@sntech.de>
Cc: 'Thomas Abraham' <thomas.abraham@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, t.figa@samsung.com, sylvester.nawrocki@gmail.com

Quoting Kukjin Kim (2013-03-19 17:00:09)
> Mike Turquette wrote:
> > 
> 
> [...]
> 
> > > > Thomas,
> > > >
> > > > Are you planning a V7 series which includes the clock alias bits from
> > > > patch #1?
> > >
> > > Kukjin has already applied this series into the linux-samsung tree [0].
> > >
> Thanks, Heiko.
> 
> Mike, yes I did, as we discussed before. Since I missed in last window for v3.9, so I merged every common clock stuff for exynos into samsung tree in the early 3.9-rc time for v3.10.
> > 
> > That really is too much code to go into drivers/clk without my ACK.  I
> > have not made much noise about this in the past but there has been more
> > and more "bonus" code slipping into drivers/clk each merge window.
> > Let's not do that any more.
> > 
> 
> Hmm, I remember you already agreed on previous version, and I thought if any further codes are required, we could do it on top of that.
> http://lists.infradead.org/pipermail/linux-arm-kernel/2013-January/143429.html
> 

In the email you linked to my use of the word "merged" did not imply an
ACK.  I was asking about merging the two separate exynos4 and exynos5
ccf development efforts together.

Furthermore if I *had* agreed on the previous version it would still
have been appropriate to put my Acked-by on those patches, which is
clearly missing today.

> However, if you don't want current codes to be sent to upstream, let me know, but I don't think it would be better to us though.

No, I am not asking you to revert/drop the patches, but I am using this
as a public example.

Regards,
Mike

> 
> Thanks.
> 
> - Kukjin
