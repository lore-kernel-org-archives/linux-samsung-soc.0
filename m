From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH 2/3] mfd: Remove MFD_CROS_EC depends on X86 || ARM
Date: Tue, 21 Jul 2015 18:30:17 -0700
Message-ID: <20150722013017.GB12724@localhost>
References: <1435191645-6022-1-git-send-email-javier.martinez@collabora.co.uk>
 <1435191645-6022-3-git-send-email-javier.martinez@collabora.co.uk>
 <20150625083854.GV15013@x1>
 <558BBF6C.7000906@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <558BBF6C.7000906@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Lee Jones <lee.jones@linaro.org>, linux-samsung-soc@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, Paul Gortmaker <paul.gortmaker@windriver.com>, Gwendal Grignou <gwendal@google.com>, Doug Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org, Samuel Ortiz <sameo@linux.intel.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, Jun 25, 2015 at 10:44:28AM +0200, Javier Martinez Canillas wrote:
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

Yep, done.

-Olof
