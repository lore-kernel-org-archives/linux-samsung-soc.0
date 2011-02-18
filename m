From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH for 2.6.38] ARM: S5PC110: fix regulator names
Date: Fri, 18 Feb 2011 18:18:53 +0900
Message-ID: <020e01cbcf4c$df2af670$9d80e350$%kim@samsung.com>
References: <1297760487-7930-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:59563 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757906Ab1BRJTA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 18 Feb 2011 04:19:00 -0500
Received: from epmmp2 (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LGT00IQ237MWOB0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 18 Feb 2011 18:18:58 +0900 (KST)
Received: from DOKGENEKIM02 ([12.23.103.104])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LGT00D6M37MKE@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 18 Feb 2011 18:18:58 +0900 (KST)
In-reply-to: <1297760487-7930-1-git-send-email-m.szyprowski@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Marek Szyprowski' <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kyungmin.park@samsung.com

Marek Szyprowski wrote:
> 
> Since commit 1130e5b3ff4 regulators are exported to debugfs. The names
> of the regulators that contains slash ('/') causes an ops during kernel
> boot. This patch fixes this issue.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  arch/arm/mach-s5pv210/mach-aquila.c |    6 +++---
>  arch/arm/mach-s5pv210/mach-goni.c   |    6 +++---
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm/mach-s5pv210/mach-aquila.c b/arch/arm/mach-
> s5pv210/mach-aquila.c
> index 1236e19..557add4 100644
> --- a/arch/arm/mach-s5pv210/mach-aquila.c
> +++ b/arch/arm/mach-s5pv210/mach-aquila.c
> @@ -149,7 +149,7 @@ static struct regulator_init_data aquila_ldo2_data = {
> 
>  static struct regulator_init_data aquila_ldo3_data = {
>  	.constraints	= {
> -		.name		= "VUSB/MIPI_1.1V",
> +		.name		= "VUSB+MIPI_1.1V",
>  		.min_uV		= 1100000,
>  		.max_uV		= 1100000,
>  		.apply_uV	= 1,
> @@ -197,7 +197,7 @@ static struct regulator_init_data aquila_ldo7_data = {
> 
>  static struct regulator_init_data aquila_ldo8_data = {
>  	.constraints	= {
> -		.name		= "VUSB/VADC_3.3V",
> +		.name		= "VUSB+VADC_3.3V",
>  		.min_uV		= 3300000,
>  		.max_uV		= 3300000,
>  		.apply_uV	= 1,
> @@ -207,7 +207,7 @@ static struct regulator_init_data aquila_ldo8_data = {
> 
>  static struct regulator_init_data aquila_ldo9_data = {
>  	.constraints	= {
> -		.name		= "VCC/VCAM_2.8V",
> +		.name		= "VCC+VCAM_2.8V",
>  		.min_uV		= 2800000,
>  		.max_uV		= 2800000,
>  		.apply_uV	= 1,
> diff --git a/arch/arm/mach-s5pv210/mach-goni.c
b/arch/arm/mach-s5pv210/mach-
> goni.c
> index 2beeb66..056f5c7 100644
> --- a/arch/arm/mach-s5pv210/mach-goni.c
> +++ b/arch/arm/mach-s5pv210/mach-goni.c
> @@ -288,7 +288,7 @@ static struct regulator_init_data goni_ldo2_data = {
> 
>  static struct regulator_init_data goni_ldo3_data = {
>  	.constraints	= {
> -		.name		= "VUSB/MIPI_1.1V",
> +		.name		= "VUSB+MIPI_1.1V",
>  		.min_uV		= 1100000,
>  		.max_uV		= 1100000,
>  		.apply_uV	= 1,
> @@ -337,7 +337,7 @@ static struct regulator_init_data goni_ldo7_data = {
> 
>  static struct regulator_init_data goni_ldo8_data = {
>  	.constraints	= {
> -		.name		= "VUSB/VADC_3.3V",
> +		.name		= "VUSB+VADC_3.3V",
>  		.min_uV		= 3300000,
>  		.max_uV		= 3300000,
>  		.apply_uV	= 1,
> @@ -347,7 +347,7 @@ static struct regulator_init_data goni_ldo8_data = {
> 
>  static struct regulator_init_data goni_ldo9_data = {
>  	.constraints	= {
> -		.name		= "VCC/VCAM_2.8V",
> +		.name		= "VCC+VCAM_2.8V",
>  		.min_uV		= 2800000,
>  		.max_uV		= 2800000,
>  		.apply_uV	= 1,
> --

Ok, applied into s5p-fixes-for-linus for 38.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
