From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 3.18 2/2] ARM: exynos_defconfig: Enable NFSv4 client
Date: Wed, 7 Feb 2018 11:46:01 +0100
Message-ID: <CAJKOXPfstifTmB-NKtYgOAXcj4NAGv9mogG4sHp6+1Sa9geDSg@mail.gmail.com>
References: <CAJKOXPfsvXfONa8gT1-Vfa1qme3kC2DQBhHHLtkmTdSA+-zRKQ@mail.gmail.com>
 <7cb705ff603f159efe60c5c43e65e4648fca5113.1517997302.git.guillaume.tucker@collabora.com>
 <84b3f560051df582f2927805775893477b44f6c7.1517997302.git.guillaume.tucker@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <84b3f560051df582f2927805775893477b44f6c7.1517997302.git.guillaume.tucker@collabora.com>
Sender: stable-owner@vger.kernel.org
To: Guillaume Tucker <guillaume.tucker@collabora.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>, kernel@collabora.com, linux-samsung-soc@vger.kernel.org, Javier Martinez Canillas <javierm@redhat.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Feb 7, 2018 at 11:21 AM, Guillaume Tucker
<guillaume.tucker@collabora.com> wrote:
> From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>
> commit 1c1fb9b0c89a2506e556114c813a606bc1508d49 upstream.
>
> NFS client is already enabled (NFS_FS) and by default it enables clients
> for version 2 and 3. Enable explicitly the version 4 client to utilize
> the newer protocol.
>
> The NFS client is especially useful for testing kernel in automated
> environments (network boot with network file system).
>
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>
> Signed-off-by: Guillaume Tucker <guillaume.tucker@collabora.com>
> ---
>  arch/arm/configs/exynos_defconfig | 1 +
>  1 file changed, 1 insertion(+)

FWIW:
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
