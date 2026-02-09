Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F83636404D
	for <linux-samsung-soc@vger.kernel.org>; Mon,  9 Feb 2026 09:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770630336; cv=none; b=QrUB9djq+hysm8MyGi+AASJgo3Iw77v1fA/7DogV6BfII5imlv4WLSQQHY+aM0emtFtMNicxytT3zQAxMA6f2DUwqNjFwsIGVHTw/Gb/TpHOPKkNt4yvfuDiJDoAV+7b1HgZWPdWWcZ788MNNmg2/+GZ+aXxu550uqoNtgyJDHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770630336; c=relaxed/simple;
	bh=d5v5sYKE5uBTBj3WsVS7a66C/AspYAMAsAPNRcySbJk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=MZ/RvanIIRkGt+a9jHzZr/aCes9fJ439H9HmW53G3CgbnvE4ggvdhUgfVpfIacNfnHt/B/xQ+BMotgje8Chx7j/zEMa7wGD8gajSb5yTAL4TJN29rDGKL3ySf2IfjW095ON1RLANQ/ofk7p3laoBfCT2cf43yNbXRYpeagcPrQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PJf/Mu2y; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PJf/Mu2y"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47ee0291921so25624885e9.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 09 Feb 2026 01:45:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770630334; x=1771235134; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JVQlXmDuk96Q/iD1SNElHM3wEluIaQ7AteOxPLd9wsU=;
        b=PJf/Mu2yyVs8NuHFd+25Q0bKwyOyEeFKLeA9eDqEDCPtYRYa1G7pjX12uS1yF7aszv
         EsHg/Qw768AzWes3tUrznpITwtJFihGjK7CPx69BzqbgT8K0Wq9X2xJfpEFTXcSEUXvH
         PyZliOSFxi8TDcpo1mTIezW+aJ3RrAgiJOTVDwi3zhN62/tAtenUAPBi0shDeUJDT84z
         FqvstoThxzIxuYKwBfcxlK/+JkHKdR6Zr+zHv+f/LDO8/fHmaEGQY+UmjDTWyN+L6/n6
         gTjVxoXzMGFOAmoBFS2u0d6iEhC4C1/27aZ+JPVoU+b2nDwZ5C1QfPvhJZRPz86kNRGy
         4q7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770630334; x=1771235134;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JVQlXmDuk96Q/iD1SNElHM3wEluIaQ7AteOxPLd9wsU=;
        b=qzvw8OVMzFg4t9LI4QFJb5IkvHTMwDafdoIMJYb52gTl1A9BEcaRiB3LduV7i/uGOt
         QGrbR1wTpR2dHrRvemGplWTNuK262Z4HpuaULxcNBFAzOZXjzco287vpikQvxPkwrD55
         BlefkTFZtQ0XnE3WMmL00QYrN3TU63fP2cev6NVsyFW8p4FcvvU3KVW201ijbpo7VCjC
         o9NXrjBnPO1X5fB2KBItUREqlHv4j925wCocLtrgpaxR0n94a4KwLIBeep7TE/RK5Kd3
         3yjWpqu+X3v9WpC4/SY/NXQQsHadneWa6cKtqo19A78AzPYmz/3l+ZSoSo2shu0Iw12w
         w2EQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYUzSqhtsNVMzAWCkidmCu+IpzGB6zmGFCvN8JeAqcdwZCSBC92pz8npyBRx96ycAjuo2wkdZj9jqvHe21XScdfA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzOhS3rR6zmyvfSbd94FEsmwvuCAEFUp23ZQRosvtrOkoAnZpii
	g18eYY6VUU3tcKPdEzyBdtvX59q40EsqtdTtSDG4PaNX6EeXbFWG5J19Bffj1kilMfw=
X-Gm-Gg: AZuq6aJMjJw/oJjN1Hs9Xfm9YUA71d5IezM8e41GBoG/PvLePQG6ww4erAVNKd7wkOl
	NF5iOYBlcIh0QeVj7aptblbDKy75gwNje++rUBkiQQ6U+4+nKCsE3qcHuMxEVcuWOwqD2Cd4wSZ
	P27Vi7Ho1wIdqmTWMFKA28ryHWms4KVZMdOlrHJqK/Elcr+rrbH9KFAei8IYFjbXbANNNOzQ3eF
	zvfXx770SyRBUDNxnYxiQR9RWaZm2I8hcxFpFTGewijB1By4C062wh+OIOAOFD1eNyHK33K4egH
	FSaS24ZvqgcNw+vThZaZ/DGRYC4ozcAeU6wCd2ngtUblACaJEg8qC/YuzgIE6TQXmxR2SnWGetJ
	XEBg9caGWkQhCWVMWYKBYp0ZD7K2MX0u0f9qGW+ONQnvdk64DvDF1NhYVBQLzxiM+E3nN7Yqu5S
	DxuX762rtlK0WCr2Kd
X-Received: by 2002:a05:600c:1d01:b0:480:1a9a:e571 with SMTP id 5b1f17b1804b1-48320213a37mr159671545e9.22.1770630334378;
        Mon, 09 Feb 2026 01:45:34 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48317d7a99asm340006885e9.11.2026.02.09.01.45.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 01:45:33 -0800 (PST)
Date: Mon, 9 Feb 2026 12:45:31 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Cc: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: [bug report] regulator: s2mps11: add S2MPG10 regulator
Message-ID: <aYmsu8qREppwBESH@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <caa37f28-a2e8-4e0a-a9ce-a365ce805e4b@stanley.mountain>

[ Smatch checking is paused while we raise funding. #SadFace
  https://lore.kernel.org/all/aTaiGSbWZ9DJaGo7@stanley.mountain/ -dan ]

Hello André Draszik,

Commit a2b8b9f33ce3 ("regulator: s2mps11: add S2MPG10 regulator")
from Jan 22, 2026 (linux-next), leads to the following Smatch static
checker warning:

	drivers/regulator/s2mps11.c:483 s2mpg10_of_parse_cb()
	warn: off by one 'ext_control' == ARRAY_SIZE()?

drivers/regulator/s2mps11.c
    458         if (of_property_read_u32(np, "samsung,ext-control", &ext_control))
    459                 return 0;
    460 
    461         switch (s2mps11->dev_type) {
    462         case S2MPG10:
    463                 switch (desc->id) {
    464                 case S2MPG10_BUCK1 ... S2MPG10_BUCK7:
    465                 case S2MPG10_BUCK10:
    466                 case S2MPG10_LDO3 ... S2MPG10_LDO19:
    467                         if (ext_control > S2MPG10_EXTCTRL_TCXO_ON2)
    468                                 return -EINVAL;
    469                         break;
    470 
    471                 case S2MPG10_LDO20:
    472                         if (ext_control < S2MPG10_EXTCTRL_LDO20M_EN2 ||
    473                             ext_control > S2MPG10_EXTCTRL_LDO20M_EN)
    474                                 return -EINVAL;
    475                         break;
    476 
    477                 default:
    478                         return -EINVAL;
    479                 }
    480 
    481                 if (ext_control > ARRAY_SIZE(ext_control_s2mpg10))

This should be >= ARRAY_SIZE().  Although the earlier checks prevent an
out of bounds access, it's still worth fixing the sanity check.

    482                         return -EINVAL;
--> 483                 ext_control = ext_control_s2mpg10[ext_control];
    484                 break;
    485 
    486         case S2MPG11:
    487                 switch (desc->id) {
    488                 case S2MPG11_BUCK1 ... S2MPG11_BUCK3:

regards,
dan carpenter
