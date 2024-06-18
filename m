Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D04C13F003
	for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Jun 2024 17:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718733073; cv=none; b=Dd9smierk3z6r8gMltkjF+n2Z8uUxMtWTZbmhj0IckyzVsrrsffPKw0X4Oz+8BooBRbDTqBIW+f6ninR6iQZJmYUdUAXdcZkja8zvGqmWC2JZ1V9OpLgmKZWEnxcjPg7YP5AqEF7ydjzyOUywNI1VdExo6mPPoFsvKfPxoWw4+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718733073; c=relaxed/simple;
	bh=+i7LdplVSBgpsqHCuk3Ek+mDHHKs0qtFfimb7c5uK0k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PJ4g8reIDvFaxnGJYXmwyQOVK8x6Ndxglog8xKWw9oc/Hsi00ZG4X+qyg5E4qJRK9FRmdHKSOs4kL9kRhVYZET+Pn691HGXTlZGdiCJ8Oe3M4asLadjlBBMevYwqEcM1LHmhZ3AMp9KJLROO88dbYqQldHVb8Xrs0KMiqyyB39U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SwuENrJq; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SwuENrJq"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-63267c30eaaso40458717b3.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Jun 2024 10:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718733070; x=1719337870; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tyXvq+2kNSq2yY1cpCgzqGKNpoe28AhGuqUANf/m0KY=;
        b=SwuENrJqza9uruPAfYte9lWutWNeHoUNvDpJph0igA+J46q0F3uAt9McddA17J6owN
         Tvk55tmEjsmEMFOVN0TOSeroegrgPvWUVZE8G6CFefV7pteLOiXRjkuxn5ir8WEen2ft
         GFMybhQvJ37TpWJuvt6JUMuz1Zm9A9I0tXtfpgJqR0cGOUxZq2JyILum4jAGUG7oTHNq
         MM15YyHYxtPpbHf2Q5xQvyKi0CJHuaW5QtQSnVc68aoHVLnWQoEx7TWiWCnXnAAAJxgt
         MALNi3TpGZahMxePWtqyrZ+y3btpv+fL3yDMY1IGJ691E1UgyvjzmBVrZcJfiRKgRst/
         edmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718733070; x=1719337870;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tyXvq+2kNSq2yY1cpCgzqGKNpoe28AhGuqUANf/m0KY=;
        b=weKGbT3r9v6/QS8f9lkwS+8FgpSZgZT6uW8wtlulMQvwYa3wfZE9YuBe4eSvkKBPXX
         8/40P5YwlhIsSC1kEvWPphlmRxtZeKZWCYKpyKWGh4JcBE2h23P8XRlVApWJFhUNlYGx
         qptTdg0it2Z6t6+6mIy9alP4OIXEm8IZKlovvLzWXUsj4nXrZoyKBXgAIDzmjHXbAi42
         XO506QRvJ1QxkpeO2W4ITRFSj/nrAxrKnHe0zzWikuI5I7Phb1FvvR0nnrDqkqUay8cW
         qix7Ag38EvESywQfpjtMRa8mfFlymxwrzzKhYkw90jdl1ImMcKUJ1WbJTmv021Ucsg55
         GsCA==
X-Forwarded-Encrypted: i=1; AJvYcCUWaq7altw6fiYRkgtH8pcJ491TZl9ftzlVQr3MdixWgvtTiP5DFghPfvUfomWZEx7WTZds1Q59uu7r0ETGi2Rlq3WZNFogBZxn4U9N7sEUoVM=
X-Gm-Message-State: AOJu0YzQZ6n7P6mKlB39HDKyTXzLzlv2aoddvo5wfVnVOMvnnPyINOT3
	YQgYTmSKSvQ55jHihMpdDzoIf/iw1l/TB8tZj+0Qnq6QG5WN3xGqP89huj3IEEaezmSqb9X+5tn
	aW7j2d282LgmTdvfKDUjftzoVascJQR3LzMKHhOHD4m5eUI+2nco=
X-Google-Smtp-Source: AGHT+IGX0rSKvmM9LtFbl2y0uuFDIWZVXyutPg9+1l/SGSIE4/dOh7rq6j1hE7fYLB7yhECyYlIakQysuwd2NawkPxQ=
X-Received: by 2002:a81:a190:0:b0:62c:b66b:c7a7 with SMTP id
 00721157ae682-63a8dd02cc5mr4803717b3.17.1718733070618; Tue, 18 Jun 2024
 10:51:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240614140421.3172674-1-peter.griffin@linaro.org> <20240614140421.3172674-2-peter.griffin@linaro.org>
In-Reply-To: <20240614140421.3172674-2-peter.griffin@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Tue, 18 Jun 2024 12:50:59 -0500
Message-ID: <CAPLW+4my8dw7BmF242vbsp9iaPGjgP47Tc5Bz6U2kL5bBHRpwg@mail.gmail.com>
Subject: Re: [PATCH 1/2] mfd: syscon: add of_syscon_register_regmap() API
To: Peter Griffin <peter.griffin@linaro.org>
Cc: lee@kernel.org, arnd@arndb.de, krzk@kernel.org, alim.akhtar@samsung.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, tudor.ambarus@linaro.org, 
	andre.draszik@linaro.org, saravanak@google.com, willmcvicker@google.com, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 14, 2024 at 9:04=E2=80=AFAM Peter Griffin <peter.griffin@linaro=
.org> wrote:
>
> The of_syscon_register_regmap() API allows an externally created regmap
> to be registered with syscon. This regmap can then be returned to client
> drivers using the syscon_regmap_lookup_by_phandle() APIs.
>
> The API is used by platforms where mmio access to the syscon registers is
> not possible, and a underlying soc driver like exynos-pmu provides a SoC
> specific regmap that can issue a SMC or hypervisor call to write the
> register.
>
> This approach keeps the SoC complexities out of syscon, but allows common
> drivers such as  syscon-poweroff, syscon-reboot and friends that are used
> by many SoCs already to be re-used.
>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  drivers/mfd/syscon.c       | 48 ++++++++++++++++++++++++++++++++++++++
>  include/linux/mfd/syscon.h |  8 +++++++
>  2 files changed, 56 insertions(+)
>
> diff --git a/drivers/mfd/syscon.c b/drivers/mfd/syscon.c
> index 7d0e91164cba..44991da3ea23 100644
> --- a/drivers/mfd/syscon.c
> +++ b/drivers/mfd/syscon.c
> @@ -192,6 +192,54 @@ static struct regmap *device_node_get_regmap(struct =
device_node *np,
>         return syscon->regmap;
>  }
>
> +/**
> + * of_syscon_register_regmap() - Register regmap for specified device no=
de
> + * @np: Device tree node
> + * @regmap: Pointer to regmap object
> + *
> + * Register an externally created regmap object with syscon for the spec=
ified
> + * device tree node. This regmap can then be returned to client drivers =
using
> + * the syscon_regmap_lookup_by_phandle() API.
> + *
> + * Return: 0 on success, negative error code on failure.
> + */
> +int of_syscon_register_regmap(struct device_node *np, struct regmap *reg=
map)
> +{
> +       struct syscon  *entry, *syscon =3D NULL;
> +
> +       if (!np || !regmap)
> +               return -EINVAL;
> +
> +       /* check if syscon entry already exists */
> +       spin_lock(&syscon_list_slock);
> +
> +       list_for_each_entry(entry, &syscon_list, list)
> +               if (entry->np =3D=3D np) {
> +                       syscon =3D entry;
> +                       break;
> +               }
> +
> +       spin_unlock(&syscon_list_slock);
> +
> +       if (syscon)
> +               return -EEXIST;
> +
> +       syscon =3D kzalloc(sizeof(*syscon), GFP_KERNEL);
> +       if (!syscon)
> +               return -ENOMEM;
> +
> +       syscon->regmap =3D regmap;
> +       syscon->np =3D np;
> +
> +       /* register the regmap in syscon list */
> +       spin_lock(&syscon_list_slock);
> +       list_add_tail(&syscon->list, &syscon_list);
> +       spin_unlock(&syscon_list_slock);
> +
> +       return 0;
> +}
> +EXPORT_SYMBOL_GPL(of_syscon_register_regmap);
> +
>  struct regmap *device_node_to_regmap(struct device_node *np)
>  {
>         return device_node_get_regmap(np, false);
> diff --git a/include/linux/mfd/syscon.h b/include/linux/mfd/syscon.h
> index c315903f6dab..aad9c6b50463 100644
> --- a/include/linux/mfd/syscon.h
> +++ b/include/linux/mfd/syscon.h
> @@ -28,6 +28,8 @@ struct regmap *syscon_regmap_lookup_by_phandle_args(str=
uct device_node *np,
>                                                     unsigned int *out_arg=
s);
>  struct regmap *syscon_regmap_lookup_by_phandle_optional(struct device_no=
de *np,
>                                                         const char *prope=
rty);
> +int of_syscon_register_regmap(struct device_node *np,
> +                             struct regmap *regmap);
>  #else
>  static inline struct regmap *device_node_to_regmap(struct device_node *n=
p)
>  {
> @@ -67,6 +69,12 @@ static inline struct regmap *syscon_regmap_lookup_by_p=
handle_optional(
>         return NULL;
>  }
>
> +static inline int of_syscon_register_regmap(struct device_node *np,
> +                                       struct regmap *regmap)
> +{
> +       return -EOPNOTSUPP;
> +}
> +
>  #endif
>
>  #endif /* __LINUX_MFD_SYSCON_H__ */
> --
> 2.45.2.627.g7a2c4fd464-goog
>
