From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 2/2] pinctrl: samsung: remove unneeded (void *) casts in
 of_match_table
Date: Mon, 15 May 2017 19:04:53 +0200
Message-ID: <20170515170453.s6ie5bu7o6o4dz6g@kozik-lap>
References: <1493156063-8446-1-git-send-email-yamada.masahiro@socionext.com>
 <1493156063-8446-3-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1493156063-8446-3-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-gpio@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Apr 26, 2017 at 06:34:23AM +0900, Masahiro Yamada wrote:
> of_device_id::data is an opaque pointer.  No explicit cast is needed.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
>  drivers/pinctrl/samsung/pinctrl-samsung.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 

Thanks, applied.

Best regards,
Krzysztof
