Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6871330568D
	for <linux-samsung-soc@vger.kernel.org>; Thu,  6 Aug 2026 13:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786021273; cv=none; b=bc1mKgfke89LQT0n5qv3d934nA2R/FSPCeChVQqfZCtkpZEENwMHE/aGPDMNwsV7833lOhXja9KUE/eZ7a+6m3StRksVMvOsMkSgbDLdNHPE8vH6hjL01OtuK3hNqp86SkuYtaKKmQwyq6fj1Pomu1lHoyLv2WQGwPe1gHZE1Zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786021273; c=relaxed/simple;
	bh=s04HVknsUgxEi6jihGejSgB/TwVykML3ayZM3Cu0Ci8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=MEblkWr1TLSxtSTK2xEIRdTUUZQxaeebJm7+OsmeIc+zGgGG0qRDfB2U+7oj+JM23PvfojvPE6ZzCu6sbncfRqwLTD3CtIzLDQ0bt0jRHziMi3Lww/W1Fu6Dkild4OS50LEc0+AqItwi4zzLQI4SHsGQjQFxe5ECMkDzi19cMfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=KHpvjunu; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="KHpvjunu"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-495757ccbc1so23215775e9.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 06 Aug 2026 06:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786021264; x=1786626064; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zz60dwOt43+w/6UxrOfYd9SvtI6AkTQj3e04Pm3ApbA=;
        b=KHpvjunuO30xZWFfXZPS5EyWGKAsSUbROB3EOXsZ0cYJkVGMmE5dYIArfAy2ohxDlf
         Kk1prMsSr19HyRqOuFezX7bbnYRA3Mk1YOFHWdFF78/lmMsrzG0aywXczJulWLtzUHXd
         2/l0i4Moc3SJ2h60sBxNxqVJXO0lrBgJY4BrAt5/sCkmIoEn59/2moxOVmKE+B7tYqX0
         +MTxqGwTqa9GYN4p/+5eS2PaZcExTLdit+T/SHq7VN6glPQrcyAxNwO8qpbqk66yNKEw
         5I0/tYqEqPYtZmbDdn8uULu5GmEhtAjb0cH9NjM73b5HVwAbBGsgu5N93FU4pBvf1Rs5
         PqUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786021264; x=1786626064;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Zz60dwOt43+w/6UxrOfYd9SvtI6AkTQj3e04Pm3ApbA=;
        b=bWfmwfn6+w8WafwWtLTw/dsmypRE8GI3vbS85QFlNkuFFvwntL1sY3RDOhsHhGfdD1
         4h1YhGLpfw2JDrYiLGvda6Tcn17aKwNSS0GsNlakfge1dB5MIjsvxbL5FIA/GhkqlbfS
         3Ul2DqsaQWtldrHYGccaN+k/nANIbIlWQWKndoX1W0cRBTvs6AxtCHYN1xriOL173mCb
         caSrrwbErN0rUa1Qh4Dnfr9SgbQRO4Ryoriatf2mF7RiUa4B1OxxYS6XmZI720HqnFxa
         t8Umsw4OUL6ieof3rrFLepuswnCdWe30xPnTn1ntNxGAukxMlij91gIFMcxOeS0uz9JY
         hj2A==
X-Forwarded-Encrypted: i=1; AHgh+RrsTnp5D5Ay0e5jq5Y460YIIWixPqa+iGVZC4I3Qw4u9MEeI9udGoXIp/gIwr5EQkRXMm6YbIMloweL8bStE06ZeQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwASG+pMKpsKh6DW6ocGTiB5zprXCaDcb9tu/PMdsQx3hqvjoS/
	14QO+5c6Qvr5csoG8yfdOXwcvugDuqHAhzqCgvHNq19RL3NxoUEIL6AG4KSk1hbL25Q=
X-Gm-Gg: AR+sD10uW51LjJvTole2gmHvGHWMvKspDK01mXoyBQl/zJKp0tUL/GMj9BAyp9wduVn
	XrroVvGR1uQPyWentqyPr8GXHJFZu2B58EYDMvq/n0G6lsqhVDS0ZoxJgdUrySakYJtapgpcH6p
	wzdiIkKvamFNifNY5lB0kAFQaawNAfm3zDbqSWFc3/sdo3+VDzxvthlCDaIoqZtffWPs0Ef6TXP
	RhsNAMtmaD7ER6Pa6bXv+1ZqJYxdvKlaoKfAMG3NgMdS4KrZbz6R+PebTXjasvzbKJ6dhJobCRX
	XcLlU5xtI+mEqU4d/2HFDLe+JqyJ11pPNGFnfyfz8m4u1D0iud3RufgrrxF0pDHCA77/XBUsXIY
	I5Saj37CDtLo6XCY42CBtBdoN40FH1HB2+Xero8ogzf4ePiK1T0QK1C29AbKvOofv4H0D+OYAQM
	NA85sx+BpWltXHnO6d8ZaTjZNxPMQjY8hfuDB4JbS7OHHBD+AJbg8po2JK3kuBPP+c+MiyHFLq2
	7Q9iaprdObn8RiwSEHJ0ve+3YPgs6XrkebMUuG6lY/ih/EDRSVT
X-Received: by 2002:a05:600c:4514:b0:496:bbce:f3 with SMTP id 5b1f17b1804b1-4994e71ed7bmr185444205e9.6.1786021264085;
        Thu, 06 Aug 2026 06:01:04 -0700 (PDT)
Received: from localhost (p200300f65f0171047a0a39ae84ac36f8.dip0.t-ipconnect.de. [2003:f6:5f01:7104:7a0a:39ae:84ac:36f8])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4994e99319bsm102317795e9.3.2026.08.06.06.01.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 06:01:02 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] clk: samsung: Don't include <linux/mod_devicetable.h>
Date: Thu,  6 Aug 2026 15:00:50 +0200
Message-ID: <20260806130050.646488-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2343; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=lIHh+rvtmrZa4l9g5kSUL7C6KlSIiEKm7NmxxSo2pLE=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqdIWCm3HPr0hCHAGrzPj0/DIS42a7yNxhWa3uZ VFUr97OGGaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCanSFggAKCRCPgPtYfRL+ TtcXB/wOB4MQkk0pa+l2wPt71bxqbbWzB6fo+l+C8SGGq7V68zVdVeFe+oshBLr8v/Ybi84XaGM asLUGXjlJxEOtGu6bkspgEh8vRvRVQghymOKjpS0RPINBrt8c1Y3MYKKYQ3zkL8vgGYm6+453SI gMe6glco7jsfp9eP7O44+PPR15Ph2kU5lkz67rMyfT+iNAQ3CSrfqEMIWUyooJO2ydGx5RTT/bX ADlcMPZhZeOBzb+Mypz/hUwSVGCRasgzjUVHwstfqOE5l22TbE/ElXt4MHME8LciGN06eFKlYRO ee/de81tsT9vPuqcMVm0YNysYjtAL1SUTeBf2y6o6IIf7k6P
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: quoted-printable

All users of drivers/clk/samsung/clk.h live in drivers/clk/samsung (see

	git grep samsung/clk.h

). All these are only using of_device_id from
the set of structures defined by this include (see

	{ git grep -l clk\\.h drivers/clk/samsung/; echo drivers/clk/samsung/clk.h=
; } | xargs grep -oh -E "\<(acpi_device_id|amba_id|ap_device_id|apr_device_=
id|auxiliary_device_id|bcma_device_id|ccw_device_id|cdx_device_id|coreboot_=
device_id|css_device_id|dfl_device_id|dmi_(device|system)_id|eisa_device_id=
|fsl_mc_device_id|hda_device_id|hid_device_id|hv_vmbus_device_id|i2c_device=
_id|i3c_device_id|ieee1394_device_id|input_device_id|ipack_device_id|isapnp=
_device_id|ishtp_device_id|mcb_device_id|mdio_device_id|mei_cl_device_id|mh=
i_device_id|mips_cdmm_device_id|of_device_id|parisc_device_id|pci_device_id=
|pci_epf_device_id|pcmcia_device_id|platform_device_id|pnp_(card_)?device_i=
d|rio_device_id|rpmsg_device_id|sdio_device_id|sdw_device_id|serio_device_i=
d|slim_device_id|spi_device_id|spmi_device_id|ssam_device_id|ssb_device_id|=
tb_service_id|tee_client_device_id|typec_device_id|ulpi_device_id|usb_devic=
e_id|vchiq_device_id|vio_device_id|virtio_device_id|wmi_device_id|x86_(cpu|=
device)_id|zorro_device_id|cpu_feature)\>" | sort | uniq -c

).

So <linux/mod_devicetable.h> can be replaced by <linux/device-id/of.h>
to get rid of another user of the former header.

Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@bay=
libre.com>
---
Hello,

note that this patch depends on
ad428f5811bd7fb3d91fa002174de533f9da94d7. So if you want to apply it
without having that commit yet in your tree, I recommend pulling

	https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux device-id-r=
ework

(or v7.2-rc2) first.

Best regards
Uwe

 drivers/clk/samsung/clk.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk.h b/drivers/clk/samsung/clk.h
index b1192ca03db5..cc41cd4ad317 100644
--- a/drivers/clk/samsung/clk.h
+++ b/drivers/clk/samsung/clk.h
@@ -11,7 +11,7 @@
 #define __SAMSUNG_CLK_H
=20
 #include <linux/clk-provider.h>
-#include <linux/mod_devicetable.h>
+#include <linux/device-id/of.h>
 #include <linux/regmap.h>
 #include "clk-pll.h"
 #include "clk-cpu.h"

base-commit: ad428f5811bd7fb3d91fa002174de533f9da94d7
--=20
2.55.0.11.g153666a7d9bb

