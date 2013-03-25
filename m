From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: RE: RE: RE: [PATCH v6 00/16] clk: exynos4/5: migrate to common
 clock framework
Date: Mon, 25 Mar 2013 10:05:57 +0900
Message-ID: <16dd01ce28f4$e8256860$b8703920$%kim@samsung.com>
References: <1361175686-19400-1-git-send-email-thomas.abraham@linaro.org>
 <20130319184938.8663.18115@quantum> <201303192212.16877.heiko@sntech.de>
 <20130319215038.8663.83548@quantum>
 <116a01ce24fd$e32658b0$a9730a10$%kim@samsung.com>
 <20130320025656.11073.90469@quantum>
 <11af01ce2526$63b0a8f0$2b11fad0$%kim@samsung.com>
 <20130320144000.11073.37741@quantum>
 <14d801ce268b$80a8d160$81fa7420$%kim@samsung.com>
 <20130322142739.834.2721@quantum>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:10010 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754996Ab3CYBF7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 24 Mar 2013 21:05:59 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MK60021IZ1VA270@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 25 Mar 2013 10:05:57 +0900 (KST)
In-reply-to: <20130322142739.834.2721@quantum>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Mike Turquette' <mturquette@linaro.org>, =?utf-8?Q?'Heiko_St=C3=BCbner'?= <heiko@sntech.de>
Cc: 'Thomas Abraham' <thomas.abraham@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, t.figa@samsung.com, sylvester.nawrocki@gmail.com

Mike Turquette wrote:

[...]

> > Yeah, I know. So if you want to add your ack on drivers/clk stuff for
> this series in samsung tree, please let me know.
> >
> 
> The patches are in pretty good shape.  Please add my ack if you are able

OK, I will.

> to rebase comfortably.  But if rebasing causes you and your downstream
> users a lot of pain then don't do it.
> 
Yes it can be, but it can be handled easily because of no-changing codes.

Note, please check Heiko's follow-up clk/samsung patches.
<http://comments.gmane.org/gmane.linux.kernel.samsung-soc/16817>

I'm fine on that and if you're ok, I'd like to take that with this series.

Thanks.

- Kukjin
