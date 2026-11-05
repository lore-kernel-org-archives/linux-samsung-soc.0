Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793841346;
	b=jPYnQl4V0JiUjwUUpH6MpAUW+1IHgF2nZK8Rvo8wdp+fZGMhwL2EYRgN2hOx4HaxfyuA
	 BsRjxlVLINji6iYxVjdlF4z355yomqRByFiHitcmJEDI7gGBhM2PWrPeaprM3iT44sjDJ
	 r0p5gAgJx44PBYb6UwdOsLmzIKR01X5Bgr9gbHzsFAiipOqOsHNPvX/eY7zUaVAvAb7bA
	 i2Uo//77Bn28s+bNaDWQYjJnNVMA9z9SkMLykKf+pO8o0b2q+z2DYs0jzgx0IE8Z6Vnd5
	 IRmQ1LEkh30qhdk7jmmwHssDVj4pwRBcmrsCnf8T2bGalplGgMXgHqQFFToPGNqqVoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793841346;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Content-Disposition;
	bh=hofK0JryGgKL/fZhmAQm61x9/fz9wA6S77HE9ruycGk=;
	b=cMj9TRsFuEI0RR39Q8UdcMJf00dOpCs6Zfeaz3LlZemnsaZCE+RJvTdf3PQSpjUt1jVt
	 U+/LXWu0+C+5EvTIx24kv5SHHv03Nvk1t1a4iYeTzOnTXoqQ1ta4cbsiaQTUiH7iWfBWS
	 3KuiKFjTP0KRgM6qLO9RpYvFfNF7Si3ufR5iqi2NxVo0EvAyuuuouIa8QpmwveNH5i8ng
	 pCA8xfvBkqojIuY2kOZM03x+EqteAZE9k3o796W4sUBNGwRpuMDa8Ku6LaZ2HPjDEYoLQ
	 lJDQ8NrRDDKi0QXcbw2NmbKdyMz4rP2L+LE/KzF04B16YRkQZf6vWkOBeyKlj/C79UA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Thn65rFN;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B846C606A329
	for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Nov 2026 01:15:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B846C606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Thn65rFN
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-14394530ec6so1912892c88.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 04 Nov 2026 17:15:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793841345; x=1794446145; darn=vger.kernel.org;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hofK0JryGgKL/fZhmAQm61x9/fz9wA6S77HE9ruycGk=;
        b=Thn65rFNnfU39wpnb0DfsmIXLStMu7RKnNYuvpHDRtU6JVvxnukMuvKSAidvGssVKL
         vIJvSfvTMC2u+i/HAu9oD7aLejbh/tHFVFxTqnoTPET+eLQnKWRIl0PKP8znLr7ROYDQ
         /qspSxKOMesAmRDz55csl0EIOM/lm5wKy/6vkF+TqAYoFdaaJcr6IySem886KFpGJNn9
         l231bzWscPyyudb8VHxifP33p8RfOQel86ck8oTQJTIaKqOmiYaKPiiOxOcmPnkz/NaT
         zP5YEH6dBftECPlZP0eXh9GHZriS/O5LNO4T/QxDjHXrDQvwip6q242mESeHQvJ86Hxq
         MiHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793841345; x=1794446145;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hofK0JryGgKL/fZhmAQm61x9/fz9wA6S77HE9ruycGk=;
        b=ePudXQjtMYhIS0L6Ln51DKXBUTtcVhuJb0tw8sCyseOkkpQrYmYQFT0JWDNk6qXcN/
         fUW0KOJJTO1CuuDyQXPUcM7t0g5MUsfKnLF3lvTymY1K3GZkoXhwn5cUVDDeC6JdVAp1
         bXOATpRmvKs+V3jVVBS66J10SugAExIYZrWMM5eQCnbQGHJl2l70+T2IqOD7lMmqBCV9
         4ma9KushaDzIbI5pG9/U8N6qFL12rdiL3/S16+bJ45UuWDBcCr3cCX8wBfOqXBi6eaTG
         sgomIY0/hZwv1C7Q1ECKN2bFNACvFYSGzZtr34hCVy8+mPT0AMs+i3Cp0qH//ygm6FB8
         dtsA==
X-Forwarded-Encrypted: i=1; AKwUvByr3B+yaK+PmawflBxrdt81f9oRW+lGxqi4jfqQNrp/CjP3I0NePOcDq9m02PpdfQRaZlTSWNyoFfilJ5HWsjHNAg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8tkl1CUD2L4F8BQo0yZbxHev7Sb1Sz3HcoletU2VGNYecS+PZi
	ZkX+6WAC1eCaXRRzOAr4uIvQBvnUBrKw29ecUtPGBSrGaJi+MfAhAt2d
X-Gm-Gg: AYBFou2Sn8FHro06FP1R5lUt1XW9uh38gTPd26gGLa5fZTzesNIcHBeIlsVzJ7TrsfR
	xgLLF+mDN7G6gs+9UXOUHrdMgWg60jWYJ7+45CXnl0sSwAgyPPV8mKquC7AAsXXXCNChOcOqbZc
	W1DM8vEXFzpj5BMm4C8H/jreuhqMU3O6nZoks8LPKe8UfqfvCXCQWU85A6SjZSUBOA2OEtpM/MC
	G6OQ//ze+Ccv/HLfknIVRZ6GT7i/xHkakS9rIT8C7SOqbSWJey25l8vKFju0GED1IZP/ySqs7Yu
	1CPkp+QG7G0EDb34hTQ9hEFbOM/KU0XMYiVXKaUWe1qeHGDJu8DinsJpGJXwHMy9eoMwKST5ZIR
	zxx61TzO7oIzcO5RPKdFd4i3FqFJJOHO8Fdy3BJnbon9NVy67WdPX8D9vPRpSHXme27eRSmod76
	npTM8KvUD13KDI+DQDV+UViGcza8Sk5TQQZj2/zSi0jF7tD8pfqBRfLjlCsisIV4rVEzJPvgAk6
	4mLcGluXBSdRJTnt36h0aBBdPROy0xocYrtEPXwLmw8Y4URwuCneK+yLiHqQGLGb9yx4gXujdlz
	zbjjwjrDm2n1H5HGmTEbJxehnwjmGudHZUWEcmLwwjXTX737yOfAI8gVRujQkrQu7igcqw==
X-Received: by 2002:a05:7022:3c87:b0:1ad:4ef5:ffed with SMTP id a92af1059eb24-1aea05f4bcfmr18283181c88.38.1793841344539;
        Wed, 04 Nov 2026 17:15:44 -0800 (PST)
Received: from localhost ([2a00:79e0:2ebe:8:c8f4:b7d9:252f:4483])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c1c283sm12146627c88.4.2026.11.04.17.15.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 17:15:43 -0800 (PST)
Date: Wed, 04 Nov 2026 17:15:42 -0800
Message-ID: <ad02069b0cdede7ae191e4a3df57f33a@gmail.com>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Russell King <linux@armlinux.org.uk>,
	Mark Brown <broonie@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Arnd Bergmann <arnd@arndb.de>,
	mfd@lists.linux.dev,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] mfd: wm831x: Support software nodes for DCDC regulators
In-Reply-To: <20261104181429.GE1650678@google.com>
References: <20261024-samsung-kp-v4-0-e21253295e68@gmail.com> <20261024-samsung-kp-v4-1-e21253295e68@gmail.com> <20261104181429.GE1650678@google.com>
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Lee,

On Wed, Nov 04, 2026 at 06:14:29PM +0000, Lee Jones wrote:
> On Sat, 24 Oct 2026, Dmitry Torokhov wrote:
> > +static int wm831x_add_devices(struct wm831x *wm831x, int wm831x_num,
> > +			      const struct mfd_cell *cells, int num_cells)
> > +{
> > +	struct wm831x_pdata *pdata = &wm831x->pdata;
> > +	int i;
> > +
> > +	struct mfd_cell *local_cells __free(kfree) =
> > +		kmemdup_array(cells, num_cells, sizeof(*cells), GFP_KERNEL);
> > +	if (!local_cells)
> > +		return -ENOMEM;
> > +
> > +	for (i = 0; i < num_cells; i++) {
> > +		struct mfd_cell *cell = &local_cells[i];
> > +
> > +		if (strcmp(cell->name, "wm831x-buckv") == 0) {
> > +			int id = cell->id - 1;
> > +
> > +			if (id >= 0 && id < WM831X_MAX_DCDC)
> > +				cell->swnode = pdata->dcdc_swnodes[id];
> > +		}
> > +	}
>
> I can't begin to tell you how much I hate this.
>
> Why are we duplicating massive static const structs just to add a S/W
> node?  Is there no other way we can do this statically?

The software node itself is defined statically in the board file
(crag_dcdc1_swnode in arch/arm/mach-s3c/mach-crag6410.c in patch 2/4),
as it describes board-specific and PMIC-instance-specific wiring -
specifically the host SoC GPIO wired to the PMIC's DVS pin (GPK(0) on
Cragganmore 6410).

Because wm831x-core.c is a generic PMIC driver that can be instantiated
on different boards or even multiple times on the same board (for
example, Cragganmore 6410 has two WM831x PMIC instances, only one of
which has a DVS GPIO wired to DCDC1), the shared static mfd_cell arrays
in wm831x-core.c cannot point to a board's software node at compile
time.

Note that local_cells is annotated with __free(kfree), so the duplicate
array only lives for the duration of the mfd_add_devices() call (which
makes its own per-device copy of each mfd_cell anyway) and is freed
immediately before wm831x_add_devices() returns.

> Since pdata is being populated already, why not just pass that on to the
> consuming child device (the regulator)?

The regulator driver (wm831x_buckv_dvs_init() in
drivers/regulator/wm831x-dcdc.c) acquires the DVS GPIO using
devm_gpiod_get(&pdev->dev, "dvs", ...). When converting the board file
away from legacy gpiod_lookup_table to software nodes (to drop the
fragile MFD device name matching and fix the GPIO chip label lookup),
gpiolib resolves the "dvs-gpios" property against the consumer device's
fwnode (&pdev->dev), so the software node needs to be attached to the
wm831x-buckv platform device.

In v2 of this series I actually tried passing the software_node pointer
through wm831x_buckv_pdata and attaching it to &pdev->dev inside the
regulator driver's probe() [1]. However, attaching a software node to
an already-registered platform device inside probe() is awkward and
requires manual teardown in the child driver, whereas mfd-core already
has built-in support for cell->swnode in mfd_add_device() (attaching
the node via device_add_software_node() before platform_device_add(),
and cleaning it up via device_remove_software_node() on error or
removal). Populating cell->swnode lets mfd-core manage the software
node lifecycle cleanly and keeps the regulator driver untouched.

If you prefer not to kmemdup the full cell table, another option would
be to split the buckv cells out of the main wm831x cell arrays and
register them via a separate mfd_add_devices() call, though that seemed
more intrusive across wm8310/wm8311/wm8312/wm8320. Please let me know
what you would prefer here.

[1] https://lore.kernel.org/all/20260708-samsung-kp-v2-7-3c6ed4c9b3b6@gmail.com/

Thanks.

-- 
Dmitry
