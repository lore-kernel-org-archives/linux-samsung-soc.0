From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH V3 1/2] ARM: dts: Add DT changes for display on snow
Date: Sun, 14 Sep 2014 02:22:54 +0900
Message-ID: <54147D6E.2030103@samsung.com>
References: <1409567792-8281-1-git-send-email-ajaykumar.rs@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f173.google.com ([209.85.192.173]:46001 "EHLO
	mail-pd0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751768AbaIMRXD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 13 Sep 2014 13:23:03 -0400
In-Reply-To: <1409567792-8281-1-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ajay Kumar <ajaykumar.rs@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, kgene.kim@samsung.com, thierry.reding@gmail.com, seanpaul@google.com, ajaynumb@gmail.com, joshi@samsung.com, prashanth.g@samsung.com

On 09/01/14 19:36, Ajay Kumar wrote:
> Add DT nodes for ptn3460 bridge chip and panel.
> Add backlight enable pin and backlight power supply for pwm-backlight.
> Also add bridge phandle needed by dp to enable display on snow.
>
> Signed-off-by: Ajay Kumar<ajaykumar.rs@samsung.com>
> ---
> Changes since V1:
> 	-- Remove "simple-panel" compatible string.
> 	-- Use GPIO_ACTIVE_HIGH instead of 0.
> 	-- Change panel node naming from "panel-simple" to "panel".
>
> Changes since V2:
> 	-- Use proper compatible string: "auo,b116xw03"
>
>   arch/arm/boot/dts/exynos5250-snow.dts |   41 ++++++++++++++++++---------------
>   1 file changed, 22 insertions(+), 19 deletions(-)
>
Applied this and 2nd one.

BTW, I resolved conflict when I applied. Please check my tree and then 
if any problems, please let me know.

Thanks,
Kukjin
