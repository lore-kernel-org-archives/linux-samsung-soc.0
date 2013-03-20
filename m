From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v6 00/16] clk: exynos4/5: migrate to common clock framework
Date: Wed, 20 Mar 2013 09:00:09 +0900
Message-ID: <116a01ce24fd$e32658b0$a9730a10$%kim@samsung.com>
References: <1361175686-19400-1-git-send-email-thomas.abraham@linaro.org>
 <20130319184938.8663.18115@quantum> <201303192212.16877.heiko@sntech.de>
 <20130319215038.8663.83548@quantum>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:38076 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754782Ab3CTAAL convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 19 Mar 2013 20:00:11 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MJX001Y9MO9OJ70@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 20 Mar 2013 09:00:09 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.199])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MJX009ZRMO9SI00@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 20 Mar 2013 09:00:09 +0900 (KST)
In-reply-to: <20130319215038.8663.83548@quantum>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Mike Turquette' <mturquette@linaro.org>, =?utf-8?Q?'Heiko_St=C3=BCbner'?= <heiko@sntech.de>
Cc: 'Thomas Abraham' <thomas.abraham@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, t.figa@samsung.com, sylvester.nawrocki@gmail.com

Mike Turquette wrote:
> 

[...]

> > > Thomas,
> > >
> > > Are you planning a V7 series which includes the clock alias bits from
> > > patch #1?
> >
> > Kukjin has already applied this series into the linux-samsung tree [0].
> >
Thanks, Heiko.

Mike, yes I did, as we discussed before. Since I missed in last window for v3.9, so I merged every common clock stuff for exynos into samsung tree in the early 3.9-rc time for v3.10.
> 
> That really is too much code to go into drivers/clk without my ACK.  I
> have not made much noise about this in the past but there has been more
> and more "bonus" code slipping into drivers/clk each merge window.
> Let's not do that any more.
> 

Hmm, I remember you already agreed on previous version, and I thought if any further codes are required, we could do it on top of that.
http://lists.infradead.org/pipermail/linux-arm-kernel/2013-January/143429.html

However, if you don't want current codes to be sent to upstream, let me know, but I don't think it would be better to us though.

Thanks.

- Kukjin
