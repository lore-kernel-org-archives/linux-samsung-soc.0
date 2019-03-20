From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v3 1/2] mfd: sec: Put one element structure
 initialisation on one line
Date: Wed, 20 Mar 2019 09:58:59 +0000
Message-ID: <20190320095859.GK4731@dell>
References: <20190213222402.20541-1-stuart.menefy@mathembedded.com>
 <20190213222402.20541-2-stuart.menefy@mathembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190213222402.20541-2-stuart.menefy@mathembedded.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stuart Menefy <stuart.menefy@mathembedded.com>
Cc: Sangbeom Kim <sbkim73@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, 13 Feb 2019, Stuart Menefy wrote:

> Change the layout of the initialisation of structures with one
> element to a single line of code. This keeps the coding style
> consistent.
> 
> Signed-off-by: Stuart Menefy <stuart.menefy@mathembedded.com>
> ---
>  drivers/mfd/sec-core.c | 58 +++++++++++++++++---------------------------------
>  1 file changed, 19 insertions(+), 39 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
