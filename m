Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF55387375
	for <linux-samsung-soc@vger.kernel.org>; Thu,  6 Aug 2026 14:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786025873; cv=none; b=oTD5es2kCc/3pYrDp/khxRr3Gt/xmcsgEjYEIBlYX3qKwHQmtE/IB4K9aVh4GD4G9WrQsKryS8S4ZxhOhib1L1FVfdN4GsCFhG+JYeBOfVPw2Nd4kv1POMVLx0kaUfxQHlykatw9lhXIU2UxxzkPwj2R02Bl3aA2IPjOZFLPI4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786025873; c=relaxed/simple;
	bh=aEacxLXLYdB5iAohZ26x7bh8JX+qMm2KFEYV7Y5E4hk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VTtBgVx9FFhasq3D+tyqQAvVWDxD0qe3OeQ3eiqRZB/Ulpj7UXzLgBQhixCkWgZKEDAcWQvvM/0Ol46ii3YfeRb1KncpW/nwrVAN3Dq1UJ3gh36Xl7p6BCp1SMMDGYrzqlcdCpCqkpQYmE61kb47ROF4FZR0I0BnmSHAxYfO3Zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XQr+eMMR; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=g9Kvlxlj; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XQr+eMMR";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="g9Kvlxlj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786025871;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lkVg+cVtGuV8k5uAXYEJ309ZVMUd84Lmc55rCI+OidU=;
	b=XQr+eMMR1h+0QCViDGCP8iF84J34L0VIone4YVJLouo8zlDudkJAtsp8AKMX8flA1RoCtD
	xQn/JQFsteLfA8HdSfx9YJFHcU11VgrfE9TlAY03lhP2pPO8LZ+QXmqmKtoe8EDqd5Kiw3
	3V6ZmKXJ0Vh5uXJSPH6g7vTrch/G96g=
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com
 [74.125.224.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-247-9qCwNH1EPRiFnK55I-sdDQ-1; Thu, 06 Aug 2026 10:17:50 -0400
X-MC-Unique: 9qCwNH1EPRiFnK55I-sdDQ-1
X-Mimecast-MFC-AGG-ID: 9qCwNH1EPRiFnK55I-sdDQ_1786025869
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-668a55b1809so6619519d50.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 06 Aug 2026 07:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1786025869; x=1786630669; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lkVg+cVtGuV8k5uAXYEJ309ZVMUd84Lmc55rCI+OidU=;
        b=g9KvlxljmALswN5jkQkg6jFYptyv/hTbnkSG7dsT5RTOPFQ3BmHjTZOwKaOM28bI/s
         mIFHF3Sbg3BmPMIoJqdP6FSk/WNYDwqJFgbxDEyL/n142BjR3e7w7AYGO9C+SdLDJu7J
         4xgCLhGCDTZWTNC9uHLNCDOoxM3RG4IAJeZmseJXnYAW/4hIHMb5nOBS5ndXGHatxrcS
         OCv+K56rqFvt2taepDnSgwKg7g16+0BMIORnc6icJbnvkvpmAJcKCbd2OBf4QSdvPaOP
         DaqaxJ+PUCs/AaTX9EkmNH4GmUGPvUyotVfnJ7O2N+7DMaEyGx9vlYX8h6mNKSRKZt78
         nk2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786025869; x=1786630669;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lkVg+cVtGuV8k5uAXYEJ309ZVMUd84Lmc55rCI+OidU=;
        b=edgX/mLpWlTH0GgK1sAmHyL9pmoOlmwMaw+NfMNKgbKkjIx2z5gQxS10S26aXlFOQZ
         J2DVzMQSK+wB0lTkwZTaYhilt8oo9AOgXrZ3Lyanj9NmZ+QpGB+5QAZAlq86DuxGPGyR
         uThXamQR53se0rFBYx8zD5smiOw1Eecas/WEw+J7z0f15wzXmeCxouXaoZ/wvkiZCtjY
         urMefWwnH1VMlSfN7dPQOpfuKXNaO9hsQIOKNOgotLh8JBsp2D57BMrPrcKqzwDib5VG
         tFI2meAYgOdutGmeUz9lnuoDE03oEiiM6UsVo9hf2k7IqApax1smt8J+ueiAE4MktxMV
         tqdg==
X-Forwarded-Encrypted: i=1; AHgh+RpS5n+PqgxV1JDwcQJmBVdDNt9ZNbeo3bKwLoFu4zhR2nZ7rsMHbYWsim5iy4C+m/rfJRf7/ZXKYNRWLHgTJJH0aA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5L2ZrlLW3icUCHXwcBo7w19vOVeQUNpS93z0AYv+/FVnP1bV7
	8I6BkXLpaJo25+p3pz/vM5IBiJ9hvfpn+Dt6fxGskMx6iT7AzbO/7MKPN8L19uZRAkWbM2g51Lg
	X91+vo4Yg9iWbiXFfwO0Pv8q76zgIpux5ybl/Z5VjZcXQlY9DX7nZ+Mv7Ax1+WYDpgJgZelvb
X-Gm-Gg: AR+sD13BE+GzWxxyN5YkbHIZ+m2qXGorK3llYVW/AV7tTs4amsJcpmwDtCVD6GczsXh
	Dd3adTAVWiIL7MDNaWMgvN+p2gJRk04xLW/pmxGynXjN8zOAthkqCtVs8sZQWhMGOwlRQXv2qWk
	6HSqwLg7kpLd871ffunOz/IKV0lEGO+YWEqGk767fGEcjLW30rJnccB5F7RPIeGPGaBzkrkEqNb
	ocZ06gLKuwiGPFHA3BPTn0doZ3n+RflPT3FCRZvTwemO2gGHRfqw6B5R+9gQPSlA+4fA5ALw/6r
	VbsgcYfS9aHnsSwETqpM6Q8l3r0IqEkFyQXJMkOqMtoqoxXQzHQICM8tkWGAIfP+R8Dq+ZYKgh5
	Fe2NxhtS7anUGR9aSM+AdDdRFxEWMIPEudt8=
X-Received: by 2002:a05:690e:2003:b0:669:48b1:d19f with SMTP id 956f58d0204a3-6699aada291mr7294569d50.39.1786025869107;
        Thu, 06 Aug 2026 07:17:49 -0700 (PDT)
X-Received: by 2002:a05:690e:2003:b0:669:48b1:d19f with SMTP id 956f58d0204a3-6699aada291mr7294515d50.39.1786025868576;
        Thu, 06 Aug 2026 07:17:48 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6699166e9dcsm5028700d50.20.2026.08.06.07.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 07:17:45 -0700 (PDT)
Date: Thu, 6 Aug 2026 10:17:36 -0400
From: Brian Masney <bmasney@redhat.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] clk: samsung: Don't include <linux/mod_devicetable.h>
Message-ID: <anSXgKZbdWJmBAkN@redhat.com>
References: <20260806130050.646488-2-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260806130050.646488-2-u.kleine-koenig@baylibre.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Thu, Aug 06, 2026 at 03:00:50PM +0200, Uwe Kleine-K=F6nig (The Capable H=
ub) wrote:
> All users of drivers/clk/samsung/clk.h live in drivers/clk/samsung (see
>=20
> 	git grep samsung/clk.h
>=20
> ). All these are only using of_device_id from
> the set of structures defined by this include (see
>=20
> 	{ git grep -l clk\\.h drivers/clk/samsung/; echo drivers/clk/samsung/clk=
=2Eh; } | xargs grep -oh -E "\<(acpi_device_id|amba_id|ap_device_id|apr_dev=
ice_id|auxiliary_device_id|bcma_device_id|ccw_device_id|cdx_device_id|coreb=
oot_device_id|css_device_id|dfl_device_id|dmi_(device|system)_id|eisa_devic=
e_id|fsl_mc_device_id|hda_device_id|hid_device_id|hv_vmbus_device_id|i2c_de=
vice_id|i3c_device_id|ieee1394_device_id|input_device_id|ipack_device_id|is=
apnp_device_id|ishtp_device_id|mcb_device_id|mdio_device_id|mei_cl_device_i=
d|mhi_device_id|mips_cdmm_device_id|of_device_id|parisc_device_id|pci_devic=
e_id|pci_epf_device_id|pcmcia_device_id|platform_device_id|pnp_(card_)?devi=
ce_id|rio_device_id|rpmsg_device_id|sdio_device_id|sdw_device_id|serio_devi=
ce_id|slim_device_id|spi_device_id|spmi_device_id|ssam_device_id|ssb_device=
_id|tb_service_id|tee_client_device_id|typec_device_id|ulpi_device_id|usb_d=
evice_id|vchiq_device_id|vio_device_id|virtio_device_id|wmi_device_id|x86_(=
cpu|device)_id|zorro_device_id|cpu_feature)\>" | sort | uniq -c
>=20
> ).
>=20
> So <linux/mod_devicetable.h> can be replaced by <linux/device-id/of.h>
> to get rid of another user of the former header.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig (The Capable Hub) <u.kleine-koenig@bayl=
ibre.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

