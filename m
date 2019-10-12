From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: [PATCH v2] hwrng: core - move add_early_randomness() out of
 rng_mutex
Date: Sat, 12 Oct 2019 23:09:28 +1100
Message-ID: <20191012120928.GA24544@gondor.apana.org.au>
References: <20191011134724.28651-1-lvivier@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191011134724.28651-1-lvivier@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laurent Vivier <lvivier@redhat.com>
Cc: linux-kernel@vger.kernel.org, Matt Mackall <mpm@selenic.com>, Marek Szyprowski <m.szyprowski@samsung.com>, linux-crypto@vger.kernel.org, 'Linux Samsung SOC' <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Oct 11, 2019 at 03:47:24PM +0200, Laurent Vivier wrote:
> add_early_randomness() is called every time a new rng backend is added
> and every time it is set as the current rng provider.
> 
> add_early_randomness() is called from functions locking rng_mutex,
> and if it hangs all the hw_random framework hangs: we can't read sysfs,
> add or remove a backend.
> 
> This patch moves add_early_randomness() out of the rng_mutex zone.
> It only needs the reading_mutex.
> 
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
> 
> Notes:
>     v2: in hwrng_register, take rng->ref only if rng is the new current_rng
> 
>  drivers/char/hw_random/core.c | 61 +++++++++++++++++++++++++----------
>  1 file changed, 44 insertions(+), 17 deletions(-)

Please rebase your patch on top of the cryptodev tree, i.e., make
this an incremental patch with a Fixes header.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
