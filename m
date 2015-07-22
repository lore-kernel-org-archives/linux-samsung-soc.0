From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH 1/3] platform/chrome: Don't make CHROME_PLATFORMS depends
 on X86 || ARM
Date: Tue, 21 Jul 2015 18:29:34 -0700
Message-ID: <20150722012934.GA12724@localhost>
References: <1435191645-6022-1-git-send-email-javier.martinez@collabora.co.uk>
 <1435191645-6022-2-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1435191645-6022-2-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Lee Jones <lee.jones@linaro.org>, linux-samsung-soc@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, Paul Gortmaker <paul.gortmaker@windriver.com>, Gwendal Grignou <gwendal@google.com>, Doug Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org, Samuel Ortiz <sameo@linux.intel.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, Jun 25, 2015 at 02:20:42AM +0200, Javier Martinez Canillas wrote:
> The Chrome platform support depends on X86 || ARM because there are
> only Chromebooks using those architectures. But only some drivers
> depend on a given architecture, and the ones that do already have
> a dependency on their specific Kconfig symbol entries.
> 
> An option is to also make CHROME_PLATFORMS depends on || COMPILE_TEST
> but is more future proof to remove the dependency and let the drivers
> be built in all architectures if possible to have more build coverage.
> 
> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>

Acked-by: Olof Johansson <olof@lixom.net>


-Olof
