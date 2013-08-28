From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [Patch v2] pinctrl: Add s5pv210 support to pinctrl-exynos
Date: Wed, 28 Aug 2013 15:11:08 +0200
Message-ID: <521DF6EC.6030206@samsung.com>
References: <1377608890-8528-1-git-send-email-m.krawczuk@partner.samsung.com>
 <CACRpkdYiB5OG-YPRozwEurPHECDzZjQUs2s_E8gCdeqDPyr+WA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:60348 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752419Ab3H1NLM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 Aug 2013 09:11:12 -0400
In-reply-to: <CACRpkdYiB5OG-YPRozwEurPHECDzZjQUs2s_E8gCdeqDPyr+WA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Mateusz Krawczuk <m.krawczuk@partner.samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ian.campbell@citrix.com>, Rob Landley <rob@landley.net>, Tomasz Figa <t.figa@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Leelakrishna A <l.krishna@samsung.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

On 08/28/2013 02:51 PM, Linus Walleij wrote:
> On Tue, Aug 27, 2013 at 3:08 PM, Mateusz Krawczuk
> <m.krawczuk@partner.samsung.com> wrote:
> 
>> This patch implements pinctrl support and adds device tree bindings
>> for s5pv210.
>>
>> Signed-off-by: Mateusz Krawczuk <m.krawczuk@partner.samsung.com>
> 
> Oh this one does add bindings, sorry for previous comment.
> 
> I want an ACK from Kukjin or Sylwester for this since it's
> something new for S5P.

I'm happy to see this, it will allow us to clean up some common
S5P/Exynos drivers by removing non-dt support from them, once
S5PV210 is converted to DT.


Regards,
-- 
Sylwester Nawrocki
Samsung R&D Institute Poland
