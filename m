From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: [PATCH 2/3] mfd: Remove MFD_CROS_EC depends on X86 || ARM
Date: Tue, 30 Jun 2015 02:09:57 -0400
Message-ID: <20150630060957.GB8349@windriver.com>
References: <1435191645-6022-1-git-send-email-javier.martinez@collabora.co.uk>
 <1435191645-6022-3-git-send-email-javier.martinez@collabora.co.uk>
 <20150625083854.GV15013@x1>
 <558BBF6C.7000906@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail1.windriver.com ([147.11.146.13]:60142 "EHLO
	mail1.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750785AbbF3GMZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 30 Jun 2015 02:12:25 -0400
Content-Disposition: inline
In-Reply-To: <558BBF6C.7000906@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Lee Jones <lee.jones@linaro.org>, linux-samsung-soc@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, Gwendal Grignou <gwendal@google.com>, Doug Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org, Samuel Ortiz <sameo@linux.intel.com>, Olof Johansson <olof@lixom.net>

[Re: [PATCH 2/3] mfd: Remove MFD_CROS_EC depends on X86 || ARM] On 25/06/2015 (Thu 10:44) Javier Martinez Canillas wrote:

> Hello Lee,
> 
> On 06/25/2015 10:38 AM, Lee Jones wrote:
> > On Thu, 25 Jun 2015, Javier Martinez Canillas wrote:
> > 
> >> A dependency on X86 || ARM for MFD_CROS_EC was added to fix the warning:
> >> 
> >> (MFD_CROS_EC) selects CHROME_PLATFORMS which has unmet direct dependencies (X86 || ARM)
> >> 
> >> This happened because CHROME_PLATFORMS had a dependency on X86 || ARM but
> >> that dependency was removed since there isn't a reason why the option can
> >> not be selected on other architectures. So now the above warning will not
> >> happen and the MFD_CROS_EC dependency can be removed since is not needed.
> >> 
> >> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
> >> ---
> >> 
> >>  drivers/mfd/Kconfig | 1 -
> >>  1 file changed, 1 deletion(-)
> > 
> > Applied for v4.3, thanks.
> > 
> 
> Thanks a lot.
> 
> Olof,
> 
> Could you please ack patch 1/3 so Lee can pick it through the mfd tree?
> Since both patches 1/3 and 2/3 are needed to fix the build warning for
> !X86 and !ARM architectures.

Checking this didn't fall through the cracks ; still seeing the issue
in xtensa (and other arch) builds of linux-next currently:

http://kisskb.ellerman.id.au/kisskb/buildresult/12452368/

Paul.
--

> 
> Best regards,
> Javier
