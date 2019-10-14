From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH v2] hwrng: core - move add_early_randomness() out of
 rng_mutex
Date: Mon, 14 Oct 2019 09:26:46 +0200
Message-ID: <cf2e09ba-108c-819d-cce1-3ee4818254d2@samsung.com>
References: <20191011134724.28651-1-lvivier@redhat.com>
        <CGME20191012120942epcas2p35ece13866825a2a056703882d58ad080@epcas2p3.samsung.com>
        <20191012120928.GA24544@gondor.apana.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191012120928.GA24544@gondor.apana.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Herbert Xu <herbert@gondor.apana.org.au>, Laurent Vivier <lvivier@redhat.com>
Cc: linux-kernel@vger.kernel.org, Matt Mackall <mpm@selenic.com>, linux-crypto@vger.kernel.org, 'Linux Samsung SOC' <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi

On 12.10.2019 14:09, Herbert Xu wrote:
> On Fri, Oct 11, 2019 at 03:47:24PM +0200, Laurent Vivier wrote:
>> add_early_randomness() is called every time a new rng backend is added
>> and every time it is set as the current rng provider.
>>
>> add_early_randomness() is called from functions locking rng_mutex,
>> and if it hangs all the hw_random framework hangs: we can't read sysfs,
>> add or remove a backend.
>>
>> This patch moves add_early_randomness() out of the rng_mutex zone.
>> It only needs the reading_mutex.
>>
>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>> ---
>>
>> Notes:
>>      v2: in hwrng_register, take rng->ref only if rng is the new current_rng
>>
>>   drivers/char/hw_random/core.c | 61 +++++++++++++++++++++++++----------
>>   1 file changed, 44 insertions(+), 17 deletions(-)
> Please rebase your patch on top of the cryptodev tree, i.e., make
> this an incremental patch with a Fixes header.

This v2 applied on the linux-next with reverted v1 fixes my issue.


When you prepare the incremental patch, feel free to add:

Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
Fixes: daae28debcb0 ("hwrng: core - move add_early_randomness() out of 
rng_mutex")
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
