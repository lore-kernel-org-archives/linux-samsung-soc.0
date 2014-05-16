From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH RFC 3/4] clk: samsung: Add driver to control CLKOUT line on
 Exynos SoCs
Date: Fri, 16 May 2014 12:52:45 +0200
Message-ID: <5375EDFD.1020708@samsung.com>
References: <1400175151-27779-1-git-send-email-t.figa@samsung.com>
 <1400175151-27779-4-git-send-email-t.figa@samsung.com>
 <CAPdUM4P7Z1eLVKuc0N1iPaekM_7kNv7KCve2MgrEziszfnzz7A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:19605 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932302AbaEPKww (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 16 May 2014 06:52:52 -0400
In-reply-to: <CAPdUM4P7Z1eLVKuc0N1iPaekM_7kNv7KCve2MgrEziszfnzz7A@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rahul Sharma <rahul.sharma@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Mike Turquette <mturquette@linaro.org>, Pankaj Dubey <pankaj.dubey@samsung.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>, Tushar Behera <tushar.behera@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Marek Szyprowski <m.szyprowski@samsung.com>

Hi Rahul,

On 16.05.2014 12:39, Rahul Sharma wrote:
> [snip]
>> +       gate->lock = &clkout_lock;
>> +
>> +       mux->reg = reg + EXYNOS_PMU_DEBUG_REG;
>> +       mux->mask = EXYNOS_CLKOUT_MUX_MASK;
>> +       mux->shift = EXYNOS_CLKOUT_MUX_SHIFT;
>> +       mux->lock = &clkout_lock;
>> +
>> +       clk = clk_register_composite(NULL, "clkout", parent_names,
>> +                                       parent_count, &mux->hw,
>> +                                       &clk_mux_ops, NULL, NULL, &gate->hw,
>> +                                       &clk_gate_ops, 0);
>> +       if (IS_ERR(clk))
>> +               goto err_unmap;
>> +
> 
> Hi Tomasz,
> 
> Do we really need a composite clock here? How about registering
> a mux and a gate separately?

What's wrong with a composite clock? It simplifies the code as just a
single clock needs to be registered. I don't see any drawbacks compared
to registering two clocks separately.

Best regards,
Tomasz
