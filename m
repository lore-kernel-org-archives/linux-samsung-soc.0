From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH v5 0/7] platform/chrome: Add user-space dev inferface support
Date: Thu, 26 Feb 2015 16:11:21 -0800
Message-ID: <CAOesGMgdpoQ3CEKFgDZxkiCLj1gRtBODGpJQGNtNGh4Pzz5TCA@mail.gmail.com>
References: <1422876388-16540-1-git-send-email-javier.martinez@collabora.co.uk>
	<CAMHSBOWy4NdPRjw2SXFmcCF2zKwx=i79RxgHR2CLnLxpamPswQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMHSBOWy4NdPRjw2SXFmcCF2zKwx=i79RxgHR2CLnLxpamPswQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Gwendal Grignou <gwendal@chromium.org>
Cc: Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Lee Jones <lee.jones@linaro.org>, Doug Anderson <dianders@chromium.org>, Bill Richardson <wfrichar@chromium.org>, Simon Glass <sjg@google.com>, Jonathan Corbet <corbet@lwn.net>, Varka Bhadram <varkabhadram@gmail.com>, Paul Bolle <pebolle@tiscali.nl>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, Feb 26, 2015 at 3:35 PM, Gwendal Grignou <gwendal@chromium.org> wrote:
> Tested-by: Gwendal Grignou <gwendal@chromium.org>
> Reviewed-by: Gwendal Grignou <gwendal@chromium.org>
>
> Tested on a chromebook pixel with kernel 4.0.0-rc1 and ectool using
> the enclosed patch in chromiumos platform/ec tree.
> I checked the lightbar is working, check the calls with "strace ectool
> ...", check the sysfs interface calls.


Thanks Gwendal.

Series has been applied and pushed out to for-next now.

Thanks all. Bring on the next batch. Javier!


-Olof
