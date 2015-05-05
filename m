From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [RESEND PATCH 4/8] mfd: cros_ec: Use a zero-length array for
 command data
Date: Tue, 05 May 2015 17:53:01 +0200
Message-ID: <5548E75D.5050407@collabora.co.uk>
References: <1428336906-14906-1-git-send-email-javier.martinez@collabora.co.uk> <1428336906-14906-5-git-send-email-javier.martinez@collabora.co.uk> <CAMHSBOUz+-cQO0zg3VaK1fwJV0m79-hwVf5Nw5ko7JpUGDRntg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMHSBOUz+-cQO0zg3VaK1fwJV0m79-hwVf5Nw5ko7JpUGDRntg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Gwendal Grignou <gwendal@chromium.org>
Cc: Olof Johansson <olof@lixom.net>, Lee Jones <lee.jones@linaro.org>, Doug Anderson <dianders@chromium.org>, Bill Richardson <wfrichar@chromium.org>, Simon Glass <sjg@google.com>, Stephen Barber <smbarber@chromium.org>, Filipe Brandenburger <filbranden@google.com>, Todd Broch <tbroch@chromium.org>, linux-samsung-soc@vger.kernel.org, Linux Kernel <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hello Gwendal,

Thanks a lot for your feedback.

On 04/24/2015 07:19 AM, Gwendal Grignou wrote:
> In general we can use kmalloc instead of kzalloc. Also some commands
> do not need malloc at all. We could allocate on stack for known small
> commands and for the keyboard case use the caller argument.
>

Sure, I'll do all the changes that you suggested when respinning the patches.
 
> Gwendal.
> 

Best regards,
Javier
