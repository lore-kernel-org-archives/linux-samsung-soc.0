Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A16074BED
	for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Jun 2024 17:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718732863; cv=none; b=ZJiXbo6hjSld0g3de/UQCjpsdOF+XgckCbl2PnIvii1AM2KoxJpRS+nAZt7IW9c0GCX2HBuHZA4cfNosYOU6y+/5KR/PgURtrJDSX9TQOO9irEe5r8xWMT+2RGDZF+xseXQvb/pW4rrZZYHf+bSjCHQfAs03TTndgLxrUT4m4fQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718732863; c=relaxed/simple;
	bh=WtKpZWcUl0e+YJfunJzlBdQYEVufWtzLJiMSdeYhNkI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QcWaFgtCGIsShcBD9+vydvLvCKHWaG8WqcX2XqstlMAHHBeV5bH2oNNlClhySePZVyIi9pUdzOt04HqY/AvGJNgxlYzeAjFep3moAhGijzeWXBRn91Yu3rQitpgYZthuTfRe/fYf5/oaQ9dGF4LgJMBtx3lEtBXLHAGSFqvWe94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s/GM+j+e; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s/GM+j+e"
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-dff305df675so3066318276.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Jun 2024 10:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718732860; x=1719337660; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WtKpZWcUl0e+YJfunJzlBdQYEVufWtzLJiMSdeYhNkI=;
        b=s/GM+j+ewxwl5okUZjGHFUX3IFYU94jfOhUo6R/ZlW/k/ZEu+CZIiqohXW9yogyJVh
         UreuH6BJKxxn2X1+jsT1Dt0kL6miBt1KrA9laLRzQJaYH2+jHrIWnzjw4tKS1pTqFDHA
         jGQb9vjf+M3vnWyeHTWf0+d2gBldYgIk17xQMnQLSoOAx76HQyiE2niKAy/9t7gilmEg
         7ccOpHhV/M22OUyUPcZ+NoeZHcR7/Phku9UK/RGUC1NcKtoF4Va/jfpAaBB2hyWbEjB2
         sv91gRujFHCyfhP9vGEHQ36vMqfHiGIYf9M6FfZC1qbCKRCCz7/K1IuDsCW7gicCY7I4
         KUFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718732860; x=1719337660;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WtKpZWcUl0e+YJfunJzlBdQYEVufWtzLJiMSdeYhNkI=;
        b=LB3ymllal5c1wpOiOZ9NDRlAeSU8ICd8YrssCb+hPxRiLTJujp3IVtXRjQmNG6N6R7
         0k30OqnT58hLls2VnLC2DEYpL+7PCoE+h9EFLCltnjhNNMK1gknzHv18zq2mT2MqSftC
         PY5NLvV+NTiAKnDxsJe6HCrQxv3QLUljYiR2SjJlptO6Tdt6/0zv0Nzv7/ZIKq+vwzBO
         oS7El6tDbck1JdKJnmIVVPm4OfAVN5D3SLhhWvv3IkEBJZdnihk1IVKsRxAmrrfxyX+7
         JbbTEFiTXIocMOfyS/Ww5Wi9fDYBVeQ/B+4CpqGLTITgvlvIXf4npvR4R6dn3wx31FZM
         wh+A==
X-Forwarded-Encrypted: i=1; AJvYcCX2x71qT4Vmfrey8Q/zkJ2h3DTbCgBAzxbfMc+3obRot/E1fS31ks/sS0D0mLoVmNoQ074yPvBREeH+lxtFTTG3saJkZujtfLSrXCpcWO/V5ug=
X-Gm-Message-State: AOJu0YzeBgZqTbfmhAMGDf/M4M0leL683dWPQePtTXiOwcUGLNUHNeZy
	w5b6Ehs3ze+87C3/bsxDXqVhF0NIm3Qsw2kMnDYnb1N18bgY7hJAefVDiW0WWC2PhRd7gyhrmR/
	inkjN3WbA/6FyltLBbTUuWGDhudyZaGYnal/Feg==
X-Google-Smtp-Source: AGHT+IFappc3wA7RX8sQbYdiSE7dEKm/VYOIaHva/VzeNskm7446FG29AlCvkzHOdVWauRc4e+y8oo3dJe1/GIgFb3s=
X-Received: by 2002:a25:846:0:b0:e01:bb57:4d1a with SMTP id
 3f1490d57ef6-e02be13b828mr587249276.19.1718732860244; Tue, 18 Jun 2024
 10:47:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240614140421.3172674-1-peter.griffin@linaro.org> <20240614140421.3172674-3-peter.griffin@linaro.org>
In-Reply-To: <20240614140421.3172674-3-peter.griffin@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Tue, 18 Jun 2024 12:47:29 -0500
Message-ID: <CAPLW+4mnCVdPwA8awj_95uwvbHXniGwCBJQyKztv6_vNOOQgmA@mail.gmail.com>
Subject: Re: [PATCH 2/2] soc: samsung: exynos-pmu: update to use of_syscon_register_regmap()
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
> For SoCs like gs101 that need a special regmap, register this with
> of_syscon_register_regmap api, so it can be returned by
> syscon_regmap_lookup_by_phandle() and friends.
>
> For SoCs that don't require a custom regmap, revert back to syscon
> creating the mmio regmap rather than duplicating the logic here.
>
> exynos_get_pmu_regmap_by_phandle() api is also updated to retrieve
> the regmap via syscon. The exynos_get_pmu_regmap_by_phandle() api
> is kept around until fw_devlink support for syscon property is added
> for the pinctrl-samsung driver that also runs at postcore_initcall
> level.
>
> All other exynos client drivers can revert back to
> syscon_regmap_lookup_by_phandle().
>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

[snip]
