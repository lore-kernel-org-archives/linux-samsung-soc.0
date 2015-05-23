From: Kukjin Kim <kgene@kernel.org>
Subject: Re: [PATCH v4 0/8] ARM: dts: exynos5: labels for overriding nodes
Date: Sat, 23 May 2015 13:00:58 +0900
Message-ID: <555FFB7A.7040300@kernel.org>
References: <1431851175-32624-1-git-send-email-k.kozlowski.k@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:41403 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750969AbbEWEBI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 23 May 2015 00:01:08 -0400
In-Reply-To: <1431851175-32624-1-git-send-email-k.kozlowski.k@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
Cc: Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

On 05/17/15 17:26, Krzysztof Kozlowski wrote:
> Hi,
> 
> 
> Changes since v3
> ================
> 1. Rebased on current Kukjin's for-next branch:
>    v4.1-rc3-34-gfcfae6b049cf
> 
> Changes since v2
> ================
> 1. New patch 8/8: ARM: dts: Use labels for overriding nodes
>    in exynos5422-odroidxu3
> 2. To avoid conflicts rebased on my "for-next" branch of
>    https://github.com/krzk/linux
>    The branch above contains some patches for Exynos5 boards
>    applied from LKML.
> 
> Changes since v1
> ================
> 1. Re-phrased the description (phandle->label). Suggested by Arnd.
> 
> 
> Description
> ===========
> The label-based notation reduces possible mistakes when overriding
> nodes by child DTSI and board files and reduces duplication
> of addresses.
> 
> The patchset refactors Exynos5 boards to use labels for overriding nodes.
> 
> Tested by comparison of decompiled DTB for each commit.
> 
Same, will sort out.

Thanks,
Kukjin
