Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 863B915D5A1;
	Mon,  7 Oct 2024 14:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728312611; cv=none; b=rkwde8hKbbs42l/301PuOpGmBDn4Ohdr2BuPY2k80LFIckNQ0lCxioefdvXZ8rCcuqcPqdWnudyqJgoXxGXeswvlVJcMzDYzxCFf3qNYro3x7dsNCyz2opr6nffb9vDJhk2M0TK1wyjD3R1L6zzk0DOnJcVNOoeu8L/6/8CxISY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728312611; c=relaxed/simple;
	bh=VoNufGpRjlApyn8L8TeohgzkctZ1bM3y9rdgxn4V/NQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MPTW90qrsw7QhbmkjGzHdCTfeu9oXUPHGfeYl62gFny+Xc/SMNKzP1IlQJjVh+mKz8W/c0BMpsK4+uRGcQc6cmk0g/g50RVBpZp+LWSW4V6GL28cz314Y+6EgXAJHaxoWB94qsH+ADs6DobfzjGmQ7caxl89DStzh1jDtZr2lEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OHItSyYN; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OHItSyYN"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2fad100dd9eso44077951fa.3;
        Mon, 07 Oct 2024 07:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728312608; x=1728917408; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FhMgyPiKtDfgc8NuEwrv29x0qScgu60O2NxPnzTca6s=;
        b=OHItSyYNgY653oa8tXIfvxWMRpd+2Yeex9vv2sBSeYHRIRsOTI5DyTtWrbF43S/NhS
         ge1kvh6oViLgFttYL1YJpABptSdQ032x3BTKGIbojbPwGdtwkb/026zmHNx/olv+klZS
         YZ9UL1u/TZenL0ytxfI2lq3hV9Rz/kEaiyPuVCsqX6hFrvTFiVpo0pATs9LWQGccpicj
         xLd4KArw/FfIjp1eUu241f0QDhol+mB3dRWpts/JYX0JW5Sl46afTAyd9/nbLfdvq8T3
         MbXp+ucfsg3QnEquFLBr/EnVvQHaLBjtoPUHa7jVTnDql57ImvC60Sv8dHZvpIH66jxr
         vMfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728312608; x=1728917408;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FhMgyPiKtDfgc8NuEwrv29x0qScgu60O2NxPnzTca6s=;
        b=o/P9F9LQ8yKCuRY8myBlw4rntP/JnirP1u0uictTY9Rmtk/Jwqyd8fdAkq0KKwgPnd
         FZkUYKyW4yVwivSHq/S59EuI0IaQ+sQXZV9B1r7cWFhlphigQAv1bAf1hGby2yWSSrQe
         GTTJaHvl9R7/Flt+y6xcoblMuP9a2mMm0WaOtyEexdXBQPhZgkUakLCjo2ViPXIJrYoD
         HPglEueQ/GkP+H962at+zlzsVV5wxWN60jU4eF9YPXq5u3dnlsXIhmbAoxuyy0dGRlO6
         e21wHsryT4feP3gt0kLOfIJAbrdh0tXP1Q7frxYfxZ1nGhG+4NncItdFAY3Me9AVZalC
         C/ig==
X-Forwarded-Encrypted: i=1; AJvYcCVDIkyLdmihDYXXe1mLQGUj8ICNNuu54oEQwywCzcOV1u2Bnvlt+gijUGcWlEtfTf+fpe9TJG7aKKPMsrDs5j1Zr9A=@vger.kernel.org, AJvYcCVG1BFb4n6y3M62MpxmCkc0TjGHuHVAOn6g2h00BtPJVGB98MJCDOoVJ60aIY/wcI0uwQFqptUqV9R5@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9wbZKtxtc3CCzSQimjgUf4O70/fSKNq6ZflcE4maPaWobPaZx
	/0rY9oznCYwz4jbIiHQgvqNHKy5ywyzg8gHvm3/6xncxzUqbbDgpy8xk9w==
X-Google-Smtp-Source: AGHT+IFfTX/SFIKhCzC1snEFv9AIMWFpChqc/yNAQ/Aapc8+skMUPDcPs9YBqE4tfXY1tEuDM/BtEQ==
X-Received: by 2002:a2e:851:0:b0:2fa:d0ec:4572 with SMTP id 38308e7fff4ca-2faf3c50c1cmr47965481fa.7.1728312607282;
        Mon, 07 Oct 2024 07:50:07 -0700 (PDT)
Received: from [127.0.1.1] (nat6-minsk-pool-46-53-210-75.telecom.by. [46.53.210.75])
        by smtp.googlemail.com with ESMTPSA id 38308e7fff4ca-2faf9ac43efsm8253791fa.45.2024.10.07.07.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 07:50:06 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Subject: [PATCH v6 0/3] Add Samsung s2dos05 pmic support
Date: Mon, 07 Oct 2024 17:49:58 +0300
Message-Id: <20241007-starqltechn_integration_upstream-v6-0-264309aa66de@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABb1A2cC/43QzYrDIBQF4FcprsfiTzRJV/MeQylXc5MIiWnVS
 oeSdx9TKFNmM12eC37n4J1EDA4jOezuJGB20S2+BP2xI3YEPyB1XclEMFExzWsaE4TLlNCO/uR
 8wiFAKm9O13NMAWGmxja6UcyIHiUpjIGI1ATwdiyQv05TOZ4D9u726P06ljy6mJbw/ZiR5XZ9N
 jb/N2ZJGUXZa60F4zXYz2EGN+3tMpMNz9Uv2HL5BlgVUHQC+05Z1dT1X1C9LnzjT7LaFgLnrGW
 iNaBewXVdfwCqCUxDhwEAAA==
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728312605; l=2515;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=VoNufGpRjlApyn8L8TeohgzkctZ1bM3y9rdgxn4V/NQ=;
 b=eFEiaI82o1Z4NeXvz2/oATe+NzWgY3VOJ18GYrIR/nJdMGdRIM/5gmtpmBJUDHR4IPIe2anGU
 eZP6gdtJuvEAJyujedk3Xt1g68n2Za8lAETUnwL59VcH7UgR79Yw5bV
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=

The S2DOS05 is a companion power management IC for the panel and touchscreen
in smart phones. Provides voltage regulators and
ADC for power/current measurements.

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
Changes in v6:
- fix uninitialized ret variable
- Link to v5: https://lore.kernel.org/r/20240617-starqltechn_integration_upstream-v5-0-ea1109029ba5@gmail.com

Changes in v5:
- Split patchset per subsystem
- Rewrite cover letter
- Link to v4: https://lore.kernel.org/r/20240913-starqltechn_integration_upstream-v4-0-2d2efd5c5877@gmail.com

Changes in v4:
- Rewrite max77705, max77705_charger, max77705_fuel_gauge from scratch
- Reorder patches:
  - squash max77705 subdevice bindings in core file because
    no resources there
  - split device tree changes
- Use _ as space for filenames in power/supply like the majority
- Replace gcc-845 freq_tbl frequencies patch with new approach,
  based on automatic m/n/pre_div value generation
- Link to v3: https://lore.kernel.org/r/20240618-starqltechn_integration_upstream-v3-0-e3f6662017ac@gmail.com

Changes in version 3:
- s2dos05 driver converted to MFD

Changes in version 2:
- s2dos05 regulator:
  - hex to decimal in regulator values
  - fix compatible value
  - remove interrupt specific code, because it's
    empty in vendor kernel, and I cannot test it on
    available hardware anyway.

---
Dzmitry Sankouski (3):
      dt-bindings: mfd: add samsung,s2dos05
      mfd: sec-core: add s2dos05 support
      regulator: add s2dos05 regulator support

 Documentation/devicetree/bindings/mfd/samsung,s2dos05.yaml |  99 +++++++++++++++++++++++++++++++++++++++++
 MAINTAINERS                                                |   4 +-
 drivers/mfd/sec-core.c                                     |  11 +++++
 drivers/regulator/Kconfig                                  |   8 ++++
 drivers/regulator/Makefile                                 |   1 +
 drivers/regulator/s2dos05-regulator.c                      | 176 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/mfd/samsung/core.h                           |   1 +
 include/linux/regulator/s2dos05.h                          |  73 ++++++++++++++++++++++++++++++
 8 files changed, 371 insertions(+), 2 deletions(-)
---
base-commit: 58ca61c1a866bfdaa5e19fb19a2416764f847d75
change-id: 20240617-starqltechn_integration_upstream-bc86850b2fe3

Best regards,
-- 
Dzmitry Sankouski <dsankouski@gmail.com>

