Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA77613B7BE;
	Thu, 26 Sep 2024 09:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727344071; cv=none; b=fLaN4LzLZl5ntFz1HC9mdSrYuoJ4RvJmLcTan2LqzhmBWzYYdUSPIZme5DjZJJErHtxSxRFuMTw/frdnwd+5FHM7f8ge8OqTDapC9ffsU4FnSdBOT8uN4dTBBdT+djgFmrIeYYmNy8dM1M85TJm10wyOFjV1gAVqCjlGv4yWZ7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727344071; c=relaxed/simple;
	bh=adZodwCXV3E1L2yUgVldd9HT85Tc8Q6aMcqWnivfDwM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Y3FTtiWGPk9VXkANPm6IwGJjefWSt064MhxZo+hgctQoDAaA/TNSFJP/zVF/D+uwkLfbpmiewztOBmds6Ts2zD7OmeUHNJZ4XP3La3XWyNtzFb1qLgC7q1mKctesGm+afbo1RcCglhxUN4qDOXpwBpGXOuHn6ibt0Pzgs2PUq1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BOqIVSXC; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BOqIVSXC"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5365c512b00so940175e87.3;
        Thu, 26 Sep 2024 02:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727344068; x=1727948868; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G9cLIStHYD0jPVaz7NpQ1Asc2qCOkfbRpKZ83f4Snlg=;
        b=BOqIVSXC7zpxh7moKSjg6FfhbJPBC+nKtusGEGag/tU4V/g4cojz8LIUnbnOACbPYI
         IflG324WWQ4/YHm3ocD8TgFQfqqxbgUA+aGXFL5VxjWM+Opwsnamd/7Q2iMcnqoMOAZQ
         b/7pfWYF+h4ptdwrz6ykp7jc5AIl0ftnNWc8pOgTKVOxvxoFfk8nt4PyZ8li08wcPaow
         7BzHCrgrtbmBgW+zp/UYVvBmxYkbiPh3jPOIVkWjU47kZoAKRz2izTwgJgIxexziZyu5
         KeyxINYUN+g8Kk4tOfVM4lltzWOUJ/9+oC35Hix/cEgWX3gziqNYRH2quBqtmatzsIAi
         BumA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727344068; x=1727948868;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G9cLIStHYD0jPVaz7NpQ1Asc2qCOkfbRpKZ83f4Snlg=;
        b=VM16+qAjucObApe6EvVQpbOZe80FFfl9HN1mYNhTEX8bcY+C8Hb3xie4xXF+iAhNgq
         M633utTSrqhyR/v3ahBVx/vu1zmFLKyh6MiTgwmTypq5oxegwHaEZgVbDCsU8iaIykh1
         TcN7v9E3hmUipuy463BR4ceUeTzjWy+tmEYjQh+KhVbg0d9dzgmj7lEn4BcGpGkkNsJ1
         ZJdlN4v6OmjVFATKmaPib4Hg6MMC8hbNDxUYXmGuOPhO6Zo0hakXzY8/1/6Q9cPp00w1
         tfDi5Aey8IeiuyypRZRtbEa1dQSbfx/vTopOmMTPiduyhgwViB4HaCx7ECk0DrLlYBZN
         M7Lw==
X-Forwarded-Encrypted: i=1; AJvYcCVB5MOf81O1vwLawiPqo2/qo+uSj9cBjY4BEXWXIN147v1M5Y46fEUrbtWG9vR+u2gaeF8IMeESfQ89@vger.kernel.org, AJvYcCW426uhSjVeqjwdRl42KFQVbvzoOSzXEKf/EUfO5UvoJZLqlQqmyDQmdPBOkxBufgNETpuu6yFNvNDXfRlsAgj6cwE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5xbLoxNGscK30xm2b9iLYQmqBdRpQJz5tagBmbHgCNqsU3G9T
	0XggM2uzqyOhZxjDK6dqMspixigfB/v3QC5rnA8+VU2+qctqmkYC
X-Google-Smtp-Source: AGHT+IF8AkpbjtMaVmDx8uVEdeLGSdKTUIqsBooH7i09P+qWwj/WQOkiBqbXWlb3Lo3jGMxG2NiYFQ==
X-Received: by 2002:a05:6512:3b8d:b0:52e:9619:e26a with SMTP id 2adb3069b0e04-5387754d154mr3982172e87.26.1727344067252;
        Thu, 26 Sep 2024 02:47:47 -0700 (PDT)
Received: from [127.0.1.1] (mm-20-1-84-93.mgts.dynamic.pppoe.byfly.by. [93.84.1.20])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-537a8648a60sm750311e87.199.2024.09.26.02.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 02:47:46 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Subject: [PATCH v5 0/3] Add Samsung s2dos05 pmic support
Date: Thu, 26 Sep 2024 12:47:29 +0300
Message-Id: <20240617-starqltechn_integration_upstream-v5-0-ea1109029ba5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALIt9WYC/43O0Q6CIBQG4FdxXEdDULCueo/WHOJR2RQNkNWc7
 x66tbqry//fzvefBTmwGhw6JwuyELTTo4khPyRIddK0gHUdM6KEZoSnAjsv7b33oDpTauOhtdL
 Hm3KenLcgB1ypghc5qWgDDEWmkg5wZaVRXYTM3PexnCw0+rHvXm8xd9r50T73NwLb2vdi8XsxM
 EwwsIZzTkkqpLq0g9T9UY0D2vCQfcBTyv4AswjSmkJT5yovhPgG13V9Ad5rAaM2AQAA
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727344064; l=2341;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=adZodwCXV3E1L2yUgVldd9HT85Tc8Q6aMcqWnivfDwM=;
 b=Tn4jQZ2eXo+tK+U1h/u5mTg0RCZvgQW/TnpGA60guWpEnw/m1tn3Qj8KR92m67q/mkTQ10Cud
 /GwmdImG2xWAAixIxYrgrV1INeSVqTOtIlQa8HNcaUdxOD2TbHjeGrJ
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=

The S2DOS05 is a companion power management IC for the panel and touchscreen
in smart phones. Provides voltage regulators and
ADC for power/current measurements.

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
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

 Documentation/devicetree/bindings/mfd/samsung,s2dos05.yaml |  99 ++++++++++++++++++++++++++++++++++++++
 MAINTAINERS                                                |   4 +-
 drivers/mfd/sec-core.c                                     |  11 +++++
 drivers/regulator/Kconfig                                  |   8 ++++
 drivers/regulator/Makefile                                 |   1 +
 drivers/regulator/s2dos05-regulator.c                      | 176 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/mfd/samsung/core.h                           |   1 +
 include/linux/regulator/s2dos05.h                          |  73 ++++++++++++++++++++++++++++
 8 files changed, 371 insertions(+), 2 deletions(-)
---
base-commit: 92fc9636d1471b7f68bfee70c776f7f77e747b97
change-id: 20240617-starqltechn_integration_upstream-bc86850b2fe3

Best regards,
-- 
Dzmitry Sankouski <dsankouski@gmail.com>

