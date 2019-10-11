From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH] hw_random: move add_early_randomness() out of rng_mutex
Date: Fri, 11 Oct 2019 10:45:22 +0200
Message-ID: <5aec0832-e18f-a557-3614-33970bc4ff1f@samsung.com>
References: <20190912133022.14870-1-lvivier@redhat.com>
        <CGME20191011084523eucas1p1fe003b9be75fc2fa864f0ab2bd896677@eucas1p1.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190912133022.14870-1-lvivier@redhat.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Laurent Vivier <lvivier@redhat.com>, linux-kernel@vger.kernel.org
Cc: linux-crypto@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, Matt Mackall <mpm@selenic.com>, 'Linux Samsung SOC' <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Laurent,

On 12.09.2019 15:30, Laurent Vivier wrote:
> add_early_randomness() is called every time a new rng backend is added
> and every time it is set as the current rng provider.
>
> add_early_randomness() is called from functions locking rng_mutex,
> and if it hangs all the hw_random framework hangs: we can't read sysfs,
> add or remove a backend.
>
> This patch move add_early_randomness() out of the rng_mutex zone.
> It only needs the reading_mutex.
>
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>

This patch landed in today's linux-next and causes the following warning 
on ARM 32bit Exynos5420-based Chromebook Peach-Pit board:

tpm_i2c_infineon 9-0020: 1.2 TPM (device-id 0x1A)
------------[ cut here ]------------
WARNING: CPU: 3 PID: 1 at lib/refcount.c:156 hwrng_register+0x13c/0x1b4
refcount_t: increment on 0; use-after-free.
Modules linked in:
CPU: 3 PID: 1 Comm: swapper/0 Not tainted 5.4.0-rc1-00061-gdaae28debcb0 
#6714
Hardware name: SAMSUNG EXYNOS (Flattened Device Tree)
[<c01124c8>] (unwind_backtrace) from [<c010dfb8>] (show_stack+0x10/0x14)
[<c010dfb8>] (show_stack) from [<c0ae86d8>] (dump_stack+0xa8/0xd4)
[<c0ae86d8>] (dump_stack) from [<c0127428>] (__warn+0xf4/0x10c)
[<c0127428>] (__warn) from [<c01274b4>] (warn_slowpath_fmt+0x74/0xb8)
[<c01274b4>] (warn_slowpath_fmt) from [<c054729c>] 
(hwrng_register+0x13c/0x1b4)
[<c054729c>] (hwrng_register) from [<c0547e54>] 
(tpm_chip_register+0xc4/0x274)
[<c0547e54>] (tpm_chip_register) from [<c055028c>] 
(tpm_tis_i2c_probe+0x138/0x1a0)
[<c055028c>] (tpm_tis_i2c_probe) from [<c07324b0>] 
(i2c_device_probe+0x230/0x2a4)
[<c07324b0>] (i2c_device_probe) from [<c05c1884>] (really_probe+0x1c4/0x48c)
[<c05c1884>] (really_probe) from [<c05c1d20>] 
(driver_probe_device+0x78/0x1f8)
[<c05c1d20>] (driver_probe_device) from [<c05bf7cc>] 
(bus_for_each_drv+0x74/0xb8)
[<c05bf7cc>] (bus_for_each_drv) from [<c05c1620>] 
(__device_attach+0xd4/0x16c)
[<c05c1620>] (__device_attach) from [<c05c0790>] 
(bus_probe_device+0x88/0x90)
[<c05c0790>] (bus_probe_device) from [<c05bdff8>] (device_add+0x478/0x62c)
[<c05bdff8>] (device_add) from [<c0734928>] 
(i2c_new_client_device+0x158/0x278)
[<c0734928>] (i2c_new_client_device) from [<c0734a50>] 
(i2c_new_device+0x8/0x14)
[<c0734a50>] (i2c_new_device) from [<c0738014>] 
(of_i2c_register_devices+0xf4/0x16c)
[<c0738014>] (of_i2c_register_devices) from [<c0734f34>] 
(i2c_register_adapter+0x180/0x458)
[<c0734f34>] (i2c_register_adapter) from [<c073b6c0>] 
(exynos5_i2c_probe+0x22c/0x28c)
[<c073b6c0>] (exynos5_i2c_probe) from [<c05c410c>] 
(platform_drv_probe+0x6c/0xa4)
[<c05c410c>] (platform_drv_probe) from [<c05c1884>] 
(really_probe+0x1c4/0x48c)
[<c05c1884>] (really_probe) from [<c05c1d20>] 
(driver_probe_device+0x78/0x1f8)
[<c05c1d20>] (driver_probe_device) from [<c05c2104>] 
(device_driver_attach+0x58/0x60)
[<c05c2104>] (device_driver_attach) from [<c05c21e8>] 
(__driver_attach+0xdc/0x174)
[<c05c21e8>] (__driver_attach) from [<c05bf6f8>] 
(bus_for_each_dev+0x68/0xb4)
[<c05bf6f8>] (bus_for_each_dev) from [<c05c0a2c>] 
(bus_add_driver+0x158/0x214)
[<c05c0a2c>] (bus_add_driver) from [<c05c30bc>] (driver_register+0x78/0x110)
[<c05c30bc>] (driver_register) from [<c0103214>] 
(do_one_initcall+0x8c/0x424)
[<c0103214>] (do_one_initcall) from [<c1001080>] 
(kernel_init_freeable+0x158/0x200)
[<c1001080>] (kernel_init_freeable) from [<c0b036a8>] 
(kernel_init+0x8/0x114)
[<c0b036a8>] (kernel_init) from [<c01010b4>] (ret_from_fork+0x14/0x20)
Exception stack(0xe88e1fb0 to 0xe88e1ff8)
1fa0:                                     00000000 00000000 00000000 
00000000
1fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 
00000000
1fe0: 00000000 00000000 00000000 00000000 00000013 00000000
irq event stamp: 296027
hardirqs last  enabled at (296157): [<c0b0bce8>] 
_raw_spin_unlock_irq+0x24/0x5c
hardirqs last disabled at (296180): [<c0b04030>] __schedule+0xd8/0x7b8
softirqs last  enabled at (296176): [<c01026bc>] __do_softirq+0x4fc/0x5fc
softirqs last disabled at (296197): [<c012fff4>] irq_exit+0x16c/0x170
---[ end trace d219e40773096999 ]---

If you need any help testing a fix for this issue, let me know.


> ---
>   drivers/char/hw_random/core.c | 60 +++++++++++++++++++++++++----------
>   1 file changed, 44 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/char/hw_random/core.c b/drivers/char/hw_random/core.c
> index 9044d31ab1a1..745ace6fffd7 100644
> --- a/drivers/char/hw_random/core.c
> +++ b/drivers/char/hw_random/core.c
> @@ -111,6 +111,14 @@ static void drop_current_rng(void)
>   }
>   
>   /* Returns ERR_PTR(), NULL or refcounted hwrng */
> +static struct hwrng *get_current_rng_nolock(void)
> +{
> +	if (current_rng)
> +		kref_get(&current_rng->ref);
> +
> +	return current_rng;
> +}
> +
>   static struct hwrng *get_current_rng(void)
>   {
>   	struct hwrng *rng;
> @@ -118,9 +126,7 @@ static struct hwrng *get_current_rng(void)
>   	if (mutex_lock_interruptible(&rng_mutex))
>   		return ERR_PTR(-ERESTARTSYS);
>   
> -	rng = current_rng;
> -	if (rng)
> -		kref_get(&rng->ref);
> +	rng = get_current_rng_nolock();
>   
>   	mutex_unlock(&rng_mutex);
>   	return rng;
> @@ -155,8 +161,6 @@ static int hwrng_init(struct hwrng *rng)
>   	reinit_completion(&rng->cleanup_done);
>   
>   skip_init:
> -	add_early_randomness(rng);
> -
>   	current_quality = rng->quality ? : default_quality;
>   	if (current_quality > 1024)
>   		current_quality = 1024;
> @@ -320,12 +324,13 @@ static ssize_t hwrng_attr_current_store(struct device *dev,
>   					const char *buf, size_t len)
>   {
>   	int err = -ENODEV;
> -	struct hwrng *rng;
> +	struct hwrng *rng, *old_rng, *new_rng;
>   
>   	err = mutex_lock_interruptible(&rng_mutex);
>   	if (err)
>   		return -ERESTARTSYS;
>   
> +	old_rng = current_rng;
>   	if (sysfs_streq(buf, "")) {
>   		err = enable_best_rng();
>   	} else {
> @@ -337,9 +342,15 @@ static ssize_t hwrng_attr_current_store(struct device *dev,
>   			}
>   		}
>   	}
> -
> +	new_rng = get_current_rng_nolock();
>   	mutex_unlock(&rng_mutex);
>   
> +	if (new_rng) {
> +		if (new_rng != old_rng)
> +			add_early_randomness(new_rng);
> +		put_rng(new_rng);
> +	}
> +
>   	return err ? : len;
>   }
>   
> @@ -457,13 +468,17 @@ static void start_khwrngd(void)
>   int hwrng_register(struct hwrng *rng)
>   {
>   	int err = -EINVAL;
> -	struct hwrng *old_rng, *tmp;
> +	struct hwrng *old_rng, *new_rng, *tmp;
>   	struct list_head *rng_list_ptr;
>   
>   	if (!rng->name || (!rng->data_read && !rng->read))
>   		goto out;
>   
>   	mutex_lock(&rng_mutex);
> +
> +	old_rng = current_rng;
> +	new_rng = NULL;
> +
>   	/* Must not register two RNGs with the same name. */
>   	err = -EEXIST;
>   	list_for_each_entry(tmp, &rng_list, list) {
> @@ -482,7 +497,6 @@ int hwrng_register(struct hwrng *rng)
>   	}
>   	list_add_tail(&rng->list, rng_list_ptr);
>   
> -	old_rng = current_rng;
>   	err = 0;
>   	if (!old_rng ||
>   	    (!cur_rng_set_by_user && rng->quality > old_rng->quality)) {
> @@ -496,19 +510,24 @@ int hwrng_register(struct hwrng *rng)
>   			goto out_unlock;
>   	}
>   
> -	if (old_rng && !rng->init) {
> +	new_rng = rng;
> +	kref_get(&new_rng->ref);
> +out_unlock:
> +	mutex_unlock(&rng_mutex);
> +
> +	if (new_rng) {
> +		if (new_rng != old_rng || !rng->init) {
>   		/*
>   		 * Use a new device's input to add some randomness to
>   		 * the system.  If this rng device isn't going to be
>   		 * used right away, its init function hasn't been
> -		 * called yet; so only use the randomness from devices
> -		 * that don't need an init callback.
> +		 * called yet by set_current_rng(); so only use the
> +		 * randomness from devices that don't need an init callback
>   		 */
> -		add_early_randomness(rng);
> +			add_early_randomness(new_rng);
> +		}
> +		put_rng(new_rng);
>   	}
> -
> -out_unlock:
> -	mutex_unlock(&rng_mutex);
>   out:
>   	return err;
>   }
> @@ -516,10 +535,12 @@ EXPORT_SYMBOL_GPL(hwrng_register);
>   
>   void hwrng_unregister(struct hwrng *rng)
>   {
> +	struct hwrng *old_rng, *new_rng;
>   	int err;
>   
>   	mutex_lock(&rng_mutex);
>   
> +	old_rng = current_rng;
>   	list_del(&rng->list);
>   	if (current_rng == rng) {
>   		err = enable_best_rng();
> @@ -529,6 +550,7 @@ void hwrng_unregister(struct hwrng *rng)
>   		}
>   	}
>   
> +	new_rng = get_current_rng_nolock();
>   	if (list_empty(&rng_list)) {
>   		mutex_unlock(&rng_mutex);
>   		if (hwrng_fill)
> @@ -536,6 +558,12 @@ void hwrng_unregister(struct hwrng *rng)
>   	} else
>   		mutex_unlock(&rng_mutex);
>   
> +	if (new_rng) {
> +		if (old_rng != new_rng)
> +			add_early_randomness(new_rng);
> +		put_rng(new_rng);
> +	}
> +
>   	wait_for_completion(&rng->cleanup_done);
>   }
>   EXPORT_SYMBOL_GPL(hwrng_unregister);

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
