From: Laura Abbott <lauraa@codeaurora.org>
Subject: Re: [PATCHv2 1/3] of: Split early_init_dt_scan into two parts
Date: Mon, 07 Jul 2014 17:54:22 -0700
Message-ID: <53BB413E.40900@codeaurora.org>
References: <1404266608-3274-1-git-send-email-lauraa@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.11.231]:51213 "EHLO
	smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753505AbaGHAyZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 7 Jul 2014 20:54:25 -0400
In-Reply-To: <1404266608-3274-1-git-send-email-lauraa@codeaurora.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tushar Behera <trblinux@gmail.com>, Russell King <linux@arm.linux.org.uk>, Kevin Hilman <khilman@linaro.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robherring2@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linaro-kernel@lists.linaro.org, afaerber@suse.de, devicetree@vger.kernel.org

On 7/1/2014 7:03 PM, Laura Abbott wrote:
> Currently, early_init_dt_scan validates the header, sets the
> boot params, and scans for chosen/memory all in one function.
> Split this up into two separate functions (validation/setting
> boot params in one, scanning in another) to allow for
> additional setup between boot params and scanning the memory.
> 
> Signed-off-by: Laura Abbott <lauraa@codeaurora.org>

I haven't heard anything more on this series but the holiday weekend
in the US probably affected that.

Grant/Rob are you okay with taking this through the devicetree tree 
if this gets a few more acks or would you rather this go through
an ARM tree?

Thanks,
Laura

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation
