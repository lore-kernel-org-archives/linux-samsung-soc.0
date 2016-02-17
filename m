From: "Keller, Jacob E" <jacob.e.keller@intel.com>
Subject: RE: [RFT] regulator: s2mps11: Simplify expression used in
 BUILD_BUG_ON for some of preprocessors
Date: Wed, 17 Feb 2016 20:37:26 +0000
Message-ID: <02874ECE860811409154E81DA85FBB58579A1F19@ORSMSX115.amr.corp.intel.com>
References: <1455696653-27023-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:63508 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S965137AbcBQUhj convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 17 Feb 2016 15:37:39 -0500
In-Reply-To: <1455696653-27023-1-git-send-email-k.kozlowski@samsung.com>
Content-Language: en-US
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>

Hi,

> -----Original Message-----
> From: linux-kernel-owner@vger.kernel.org [mailto:linux-kernel-
> owner@vger.kernel.org] On Behalf Of Krzysztof Kozlowski
> Sent: Wednesday, February 17, 2016 12:11 AM
> To: Sangbeom Kim <sbkim73@samsung.com>; Krzysztof Kozlowski
> <k.kozlowski@samsung.com>; Liam Girdwood <lgirdwood@gmail.com>;
> Mark Brown <broonie@kernel.org>; linux-kernel@vger.kernel.org; linux-
> samsung-soc@vger.kernel.org
> Cc: Arnd Bergmann <arnd@arndb.de>
> Subject: [RFT] regulator: s2mps11: Simplify expression used in
> BUILD_BUG_ON for some of preprocessors
> 
> Apparently some preprocessors have problems with interpreting
> BUILD_BUG_ON such as:
> 	var = ARRAY_SIZE(s2mps15_regulators);
> 	BUILD_BUG_ON(S2MPS_REGULATOR_MAX < var);
> so let make it more obvious for them.
> 

Doesn't have much to do with the preprocessor, but rather exactly how the compiler optimizes the variable. Some kernel configurations also impact this, and it heavily depends on whether the compiler actually optimizes away the variable. BUILD_BUG_ON may work a lot of the time, depending heavily on the compiler.

BUILD_BUG_ON only works for constant expressions, so it is safer to put the value in directly, because using a variable will only work if the compiler optimizes the use of a variable away entirely. In this case it is somewhat surprising that it doesn't, but would depend on what compiler version and what kernel build rules you were using. For example allmodconfig ends up selecting everything yes if it's not a module for kernel build options and results in some BUILD_BUG_ON failures because of that)

Thanks,
Jake
