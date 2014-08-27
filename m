From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 10/14] arm64: dts: add pinctrl support to EXYNOS7
Date: Wed, 27 Aug 2014 13:14:06 +0200
Message-ID: <53FDBD7E.3050102@samsung.com>
References: <1409132660-1898-1-git-send-email-ch.naveen@samsung.com>
 <1409132660-1898-2-git-send-email-ch.naveen@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:27626 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753625AbaH0LOL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 Aug 2014 07:14:11 -0400
In-reply-to: <1409132660-1898-2-git-send-email-ch.naveen@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Naveen Krishna Chatradhi <ch.naveen@samsung.com>, catalin.marinas@arm.com
Cc: naveenkrishna.ch@gmail.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, cpgs@samsung.com, Thomas Abraham <thomas.ab@samsung.com>, Rob Herring <robh@kernel.org>

Hi Naveen,

Please see my comments inline.

On 27.08.2014 11:44, Naveen Krishna Chatradhi wrote:
> Add the required pin configuration support to EXYNOS7

[snip]

> +/ {
> +	/* ALIVE block @10580000 */
> +	pinctrl@10580000 {

This syntax repeating the whole hierarchy of nodes in every dts file is
considered obsolete in case of Exynos DT sources. Please switch to
reference-based one. Please see related files for Exynos5260 and 5800 as
examples.

[snip]

> +		disp_teson: disp_teson {
> +			samsung,pins = "gpg0-1";
> +			samsung,pin-function = <2>;
> +		};
> +
> +		disp_tesoff: disp_tesoff {
> +			samsung,pins = "gpg0-1";
> +			samsung,pin-function = <0>;

This is not a special function, so I don't think it belongs to this file.

Best regards,
Tomasz
