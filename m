From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 2/2] dt-bindings: clock: Move exynos-audss-clk.h to
 dt-bindings/clock
Date: Tue, 18 Mar 2014 15:32:07 +0100
Message-ID: <532858E7.3040802@samsung.com>
References: <1394085884-13081-1-git-send-email-tushar.behera@linaro.org>
 <1394085884-13081-3-git-send-email-tushar.behera@linaro.org>
 <531D054E.70008@gmail.com> <53277548.60300@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:36685 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755613AbaCROcN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 Mar 2014 10:32:13 -0400
In-reply-to: <53277548.60300@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>
Cc: Tushar Behera <tushar.behera@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, mark.rutland@arm.com, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, robh+dt@kernel.org, rob@landley.net, galak@codeaurora.org, plagnioj@jcrosoft.com, linux@maxim.org.za, Grant Likely <grant.likely@secretlab.ca>

On 17.03.2014 23:20, Kukjin Kim wrote:
> On 03/10/14 09:20, Tomasz Figa wrote:
>> On 06.03.2014 07:04, Tushar Behera wrote:
>>> Most of the clock related dt-binding header files are located in
>>> dt-bindings/clock folder. It would be good to keep all the similar
>>> header files at a single location.
>>>
>>> Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
>>> CC: Kukjin Kim <kgene.kim@samsung.com>
>
> Acked-by: Kukjin Kim <kgene.kim@samsung.com>
>
> Or shall I take this into samsung tree?

I guess so.

Or should this whole series go through DT tree?

Best regards,
Tomasz
