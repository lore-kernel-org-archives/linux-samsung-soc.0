Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 793A03F23CB
	for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Jan 2026 15:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769095143; cv=none; b=iYa85XZXmuEg4V61LVqDvniH3DmbJS1l1yiVze7Fad1wBOFpR3I++DkADEOTZx5HyiqyVVykDjhJWgem5mCPiIUSKRhXV2lXzTqk0gRfy+EKCwNzq9p7yLSN+dTub9W4u3EQ/ScA03voHvlGaM/HdrpXH3TOhemGxB1ScJE5Yp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769095143; c=relaxed/simple;
	bh=QO+Klz71nnsExe6hmzmUDR1fZn7FWwQeBhK8j1pFyL8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WJfpK5RsxlzeDWbRXCLmEz9pY3komtBFapZF70WkzglvMJ/i3XRkor9kRVkkKgT8GYfpU98FEmTcRJl6oQdZpSaTiRkE+V0jyp125GupWmIYb5z2JH8wHj/iRh9Y/Ps0SpqwxIva/PqvzMODghdjRrV9BDubRW0kjN7cFi/hEW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nsx1ywyU; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nsx1ywyU"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-432d256c2e6so1030952f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Jan 2026 07:19:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769095139; x=1769699939; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QO+Klz71nnsExe6hmzmUDR1fZn7FWwQeBhK8j1pFyL8=;
        b=nsx1ywyUu/VuWsJG+fEnqT2mceITAqNclHFvCfeb9TLI77+WZoBfxlS+iUe2IBpXZM
         s/OVYHuLewBVoRidTnBxu/QyhP2aeoDfA51ngpnwlwQoQ4C+qulMAZx3aYP8egPyvUGk
         /7bSEIXtEyW2mBGcgnjK9rwtArhJYqyc1g/oMykhGGnZqiMqaYhZdXeOYOUA2f4I/6eN
         AzApDLHhgKW+/Iy+K4nbntcl7VLOd8woC95eJAWcuid4Qh+piHp1cbHB08z1QH0F7B78
         ooM/0ZjbkfrgdjnZOg8UakIfv71CcfQfLNH5ZTW8FZatBVKTR4FASEhoCX/Tz5NywLnG
         nCzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769095139; x=1769699939;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QO+Klz71nnsExe6hmzmUDR1fZn7FWwQeBhK8j1pFyL8=;
        b=s/xLTVGkQTqavWyuvkrxaq4pQ7h06uYcGxBWl5LzA9/M2HEb4LLlOP4yWH71coCo3I
         8ZLXLchAtPfgKfniP+Lxg5eTEvjI1kbngRlOrucDFtlb+VVdfFSiKV3UTOtAanPho6iO
         KGt+nE1oN0DTxos4v/eafR82vedXc2SYynucmKMWrXeIbAP4ggr6cqmdx7OiJQY9BeVq
         m/H7AnQfnUK30wcF/zSw8JXlzS/fn//7NIue3jGhw+BMiL/vXcocm59NaNprA7Vbk2jr
         CmGpo6EaRdJBYLYolxKXXuX09Eqxr5c2Ekl51J0niW680lSUMYdmFj3wXQfM1k6hFsYH
         E6WA==
X-Forwarded-Encrypted: i=1; AJvYcCVrM1WfRg7cgWU4VTHhKO2UPJXE4caYKepAj2aLV4lvAr5mtTQd1AUUvKexQdilYgDuPn2tfwmNt3zGGLHw/OSU8A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwvgG9ziHzbJXNjDvfPwW/kTcvf3ElimpzbU3oUi/pPe02V/4VC
	fsiP+1px9+AVlxds3J838f0AktiRfeXhA8muxWJ5yVGmWFXymqPfGTbVWTJolxWH4AexbyoMJB1
	sE5lOgro=
X-Gm-Gg: AZuq6aKZTMxqtWlFv/Vci9DlbZVC//0JMOBMDu5oVnSYrvsIZd3MvwEtlc+u1lzSyt5
	dZXuReWI5neZLvuDZdaeG/Daa/EaBmEZQ9lBxAleI4Bi+NK+qAJSzvBxOiXg406ti9hlulUx0Mh
	m/RaGeVPh3+jJEakKOQ2ei1Rrkmw9SLpqtaFOJLkyrazR4371TmnHR12apmYN8Tn7AvyU98ckng
	RzualCv3ktAhREOAzCUlGY+6qQ54lZVCPsvA3PGYwg94kXdrgIdhErmt7tzvTBIUdv+dcdG6vsB
	oOHjLrPs+eaoOs5I6tY6XYq7Eu0650nbG4aO/SyJ8mAhw4Z3iIOhX0ILjKl0VSOEMUEJ7YwuNh0
	udEHKa8dJR/7feb/ln+ZQPNEErWriQNL10HX97ibOTptwHdFVUsshHJBNB/y+uoEZ4SOnaL2c+Y
	Hd25tNm/5Ig+F2i+Xm9g==
X-Received: by 2002:a05:6000:2012:b0:42f:bad7:af76 with SMTP id ffacd0b85a97d-4358fed8000mr16686929f8f.15.1769095138525;
        Thu, 22 Jan 2026 07:18:58 -0800 (PST)
Received: from draszik.lan ([212.129.87.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4359314bbc6sm20083983f8f.12.2026.01.22.07.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 07:18:58 -0800 (PST)
Message-ID: <1df01358fc8e5885e20c24b6cf983be695acc479.camel@linaro.org>
Subject: Re: [PATCH v6 00/20] Samsung S2MPG10 regulator and S2MPG11 PMIC
 drivers
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Lee Jones <lee@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,  Mark Brown <broonie@kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Krzysztof Kozlowski	
 <krzk+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, Bartosz
 Golaszewski	 <brgl@kernel.org>, Peter Griffin <peter.griffin@linaro.org>,
 Will McVicker	 <willmcvicker@google.com>, Juan Yescas <jyescas@google.com>,
 	kernel-team@android.com, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Bartosz Golaszewski	
 <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 22 Jan 2026 15:18:57 +0000
In-Reply-To: <20260122151104.GL3831112@google.com>
References: <20260105-s2mpg1x-regulators-v6-0-80f4b6d1bf9d@linaro.org>
	 <20260122150634.GK3831112@google.com> <20260122151104.GL3831112@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2026-01-22 at 15:11 +0000, Lee Jones wrote:
>=20
> Also, FYI, you may wish to run some per-patch more tests:
>=20
> "[PATCH v6 17/20] regulator: s2mps11: refactor S2MPG10" has no obvious st=
yle problems and is ready for submission.
> WARNING: Argument '_r_mask' is not used in function-like macro
> #102: FILE: drivers/regulator/s2mps11.c:759:
> [...]
> WARNING: Argument '_r_table' is not used in function-like macro
> #102: FILE: drivers/regulator/s2mps11.c:759:
> [...]
> WARNING: Argument '_r_table_sz' is not used in function-like macro
> #102: FILE: drivers/regulator/s2mps11.c:759:

This is mentioned in the commit message and they are false-positives due
to patch context

Cheers,
Andre'
