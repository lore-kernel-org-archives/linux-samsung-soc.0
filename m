From: Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH] hw_random: move add_early_randomness() out of rng_mutex
Date: Fri, 11 Oct 2019 13:00:55 +0200
Message-ID: <bbd13e79-b28a-e339-61e8-048f658437be@redhat.com>
References: <20190912133022.14870-1-lvivier@redhat.com>
 <CGME20191011084523eucas1p1fe003b9be75fc2fa864f0ab2bd896677@eucas1p1.samsung.com>
 <5aec0832-e18f-a557-3614-33970bc4ff1f@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5aec0832-e18f-a557-3614-33970bc4ff1f@samsung.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-kernel@vger.kernel.org
Cc: linux-crypto@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, Matt Mackall <mpm@selenic.com>, 'Linux Samsung SOC' <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 11/10/2019 10:45, Marek Szyprowski wrote:
> Hi Laurent,
> 
> On 12.09.2019 15:30, Laurent Vivier wrote:
>> add_early_randomness() is called every time a new rng backend is added
>> and every time it is set as the current rng provider.
>>
>> add_early_randomness() is called from functions locking rng_mutex,
>> and if it hangs all the hw_random framework hangs: we can't read sysfs,
>> add or remove a backend.
>>
>> This patch move add_early_randomness() out of the rng_mutex zone.
>> It only needs the reading_mutex.
>>
>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> 
> This patch landed in today's linux-next and causes the following warning 
> on ARM 32bit Exynos5420-based Chromebook Peach-Pit board:
> 
> tpm_i2c_infineon 9-0020: 1.2 TPM (device-id 0x1A)
> ------------[ cut here ]------------
> WARNING: CPU: 3 PID: 1 at lib/refcount.c:156 hwrng_register+0x13c/0x1b4
> refcount_t: increment on 0; use-after-free.
> Modules linked in:
> CPU: 3 PID: 1 Comm: swapper/0 Not tainted 5.4.0-rc1-00061-gdaae28debcb0 
> #6714
> Hardware name: SAMSUNG EXYNOS (Flattened Device Tree)
> [<c01124c8>] (unwind_backtrace) from [<c010dfb8>] (show_stack+0x10/0x14)
> [<c010dfb8>] (show_stack) from [<c0ae86d8>] (dump_stack+0xa8/0xd4)
> [<c0ae86d8>] (dump_stack) from [<c0127428>] (__warn+0xf4/0x10c)
> [<c0127428>] (__warn) from [<c01274b4>] (warn_slowpath_fmt+0x74/0xb8)
> [<c01274b4>] (warn_slowpath_fmt) from [<c054729c>] 
> (hwrng_register+0x13c/0x1b4)

This can happen if hwrng_init() has not been called for rng, that is
called by set_current_rng().

It appears with this patch because I have introduced the kref_get()
before the call of add_early_randomness() when the rng device is new but
is not set as the current one. So add_early_randomness() was called on
an unitialized device (it was already the case before)

I wanted to take the ref before releasing the mutex to avoid race
condition, but if the new rng device is not the new current_rng one, we
don't need that as the ref is only used with current_rng device.

I'm going to rework this patch.

Thanks,
Laurent
