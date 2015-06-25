From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [PATCH 2/3] mfd: Remove MFD_CROS_EC depends on X86 || ARM
Date: Thu, 25 Jun 2015 10:44:28 +0200
Message-ID: <558BBF6C.7000906@collabora.co.uk>
References: <1435191645-6022-1-git-send-email-javier.martinez@collabora.co.uk> <1435191645-6022-3-git-send-email-javier.martinez@collabora.co.uk> <20150625083854.GV15013@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:44407 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751149AbbFYIoe (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 25 Jun 2015 04:44:34 -0400
In-Reply-To: <20150625083854.GV15013@x1>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, Paul Gortmaker <paul.gortmaker@windriver.com>, Gwendal Grignou <gwendal@google.com>, Doug Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org, Samuel Ortiz <sameo@linux.intel.com>, Olof Johansson <olof@lixom.net>

Hello Lee,

On 06/25/2015 10:38 AM, Lee Jones wrote:
> On Thu, 25 Jun 2015, Javier Martinez Canillas wrote:
> 
>> A dependency on X86 || ARM for MFD_CROS_EC was added to fix the warning:
>> 
>> (MFD_CROS_EC) selects CHROME_PLATFORMS which has unmet direct dependencies (X86 || ARM)
>> 
>> This happened because CHROME_PLATFORMS had a dependency on X86 || ARM but
>> that dependency was removed since there isn't a reason why the option can
>> not be selected on other architectures. So now the above warning will not
>> happen and the MFD_CROS_EC dependency can be removed since is not needed.
>> 
>> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
>> ---
>> 
>>  drivers/mfd/Kconfig | 1 -
>>  1 file changed, 1 deletion(-)
> 
> Applied for v4.3, thanks.
> 

Thanks a lot.

Olof,

Could you please ack patch 1/3 so Lee can pick it through the mfd tree?
Since both patches 1/3 and 2/3 are needed to fix the build warning for
!X86 and !ARM architectures.

Best regards,
Javier
