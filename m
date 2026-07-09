Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2162333440
	for <linux-samsung-soc@vger.kernel.org>; Thu,  9 Jul 2026 14:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783608342; cv=none; b=GM4te3r5uBns2nGOUwcIRO5WFmtINpD6Qzwa/UIJm/8W5DMlTt2L0abfVwclF2iR+/hmphuLKzF0ImCHY6+e3q5BCwODJnuy0hCd+JxZc3kcRySb+AZSeyRNosiAfsyhsaxy8IdB7OD6mJtWER/YsEqW7R5JZA4Tl+rNWmitE4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783608342; c=relaxed/simple;
	bh=tXWfnS9QrYJVjwLQmP9pKe+9UsmOp/aDaXYeqzx2T3A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qCHp+uUvs6o6oX0lCn6xFSKj1jIYmdJPSmCaMS+RcA21EPxlc1DhaqS7hxUmiDZI+5XhzQAwjz27jlXNxX6gDZRTQFeLifKGn/nVbY/OuvL40vsZHXp9+v3l2rqGX1cfwlsQIOOkS894BOsj+5EuBgKBdhslI8PGDMuWgfg28VE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j0UXS/Zp; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j0UXS/Zp"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-47d70879764so1397159f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 09 Jul 2026 07:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783608339; x=1784213139; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8evbnQ4bByTeP1z+8SG4L+efiBu7EqVA4ISoNL6wzmM=;
        b=j0UXS/Zp2EcG8+sGgetko/TLteEG4tg3Wai0flrI3F/X28J2XDwb3OLPNJByFHmmbM
         h485m4PTTRIszU/ERAwhTWvDowjDdxN0i4J2g5lJwobRqOCvyfrE4g+3G99O0F1N8eKH
         9DURwl/dIN9OGB9r9pbM59Ku9k1khguppyL+9SrV6R+ZwkxOTZn4exLvIgRsgkjFZ5e8
         rNsqXkfE0lW9gaq+hLdgPWs5/HyDjNW7gyKKbAkVNuTYFec5DxQ8uoxFB++nn6GmJH/Q
         +a64qG02kmDPm2P+F6YnjPmuvWkffbx8gAP7Q92llibGEF4OA5bUpPfPce2mTfszw/0k
         hW3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783608339; x=1784213139;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8evbnQ4bByTeP1z+8SG4L+efiBu7EqVA4ISoNL6wzmM=;
        b=XoQoSDrwf8dJb0arC/8U/ABpb66vCaFN4trB9e9qqUiz93agOh7NLlkwFu+IDniEAW
         3mkk8QhJRwr1VLyj4IrPsrkAuC/aAO81p2ZFzvIJJeSZXHrmPogPQmeGuI5vs3/xvV8u
         O/jmn9rt+v4pzoWx4YIvJBrub1ZtisEikoxSDkYeZDzzfhiD88SoBhAgMwzlgx1cWD8/
         IcWpFlkLE7ge+LhgdEqhE8gpsCgDPz3E/lPj+AqHGbdT4eDCNvykoMoDKegEU4QZAY6t
         Xa45ONZ/NC0IFngCQXkN/hfZh71T4sLyvFeuGLZBbERPGd3OJvbQlqXxZKBKfM//JjHX
         swcA==
X-Forwarded-Encrypted: i=1; AHgh+RpB992htk+4aO5in3G3HnEpLt++iEsv2bEXWq8iVtCiUk0D2VL9m2F8BAR2H2bCPK4oQYrgQ64frR8YHG/sbHsYmg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzOA+AgSZ/+QDC4jiSNte8kBHVdyvZQWXYrhXELIZPeVqgvKQer
	1H6X/FQUo7MJB0VF8ivgeLvBwsT5Q1BJsyim8xL7FpPVWAPViFAPMGDTH6w8VmEtvH8=
X-Gm-Gg: AfdE7cnQ8ePqc8s6dZjPb6fOwPu4rFWSG2O0VTeJ6mxLOa4zxBZ9P3q1IGoohksDO0A
	3H+4gGjQPUExhwsKk1PQ93VUvEyvBTZEDdiLM34flsKLMQ0mGCqbC85myA1UexMcIKOl16I7mUa
	+epcvOt8IHyt3rRnXw+gkxMI1p+zouMthBU8BnChaz+C7b1//IvXDj4l2bly/zBSiIoPn6qSdbk
	xvVlwxFOPvGL6I0GZBBlSL0I4kAZPv7JDxh+EiRGbU8cJztOM9UJ9gMsccb3T9i825o2JEUYK9A
	Bg51LGJoDbCJc2DZ4zYuH+o+nZkgxAlE2rjru86B60II6yXXKlsz0SKvYM24ckKSpyhvpPDGfnC
	DvKgJQpQxzyYa9KAPE0n3BSE/cIiSyEH616xW+MrlNmXT3pEQT5qV9RkEEuLsxsWPr9zlPBZW1h
	KdebwxMKBfb5Mf2BZ2mOPez/9Dfj6EcZjk7BnuM+Sp13IH3Rcs6Ua9HYI9yGCWMS5nJ/udyZXBp
	VBn
X-Received: by 2002:a05:6000:2909:b0:476:504f:7a8 with SMTP id ffacd0b85a97d-47df081e2c4mr8073399f8f.55.1783608339161;
        Thu, 09 Jul 2026 07:45:39 -0700 (PDT)
Received: from [127.0.1.1] ([2.122.8.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960b06sm50995732f8f.28.2026.07.09.07.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 07:45:38 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Subject: [PATCH v4 0/2] Exynos850 AP-to-APM mailbox support
Date: Thu, 09 Jul 2026 15:45:35 +0100
Message-Id: <20260709-exynos850-ap2apm-mailbox-v4-0-caf2fe9a237d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA+0T2oC/43N0QrCIBTG8VcJrzPc0Uy76j2iC6eeTdjm0BiL2
 LvnuqkIosv/B+d37iT7FHwmx82dJD+FHOJQQmw3xLZmaDwNrjQBBpJxYNTPtyFmtWfUjGDGnvY
 mdHWcqUVkVjmplVaknI/JY5if9PlSug35GtPt+Wmq1vUPdKooo1pxX3MELdGeujCYFHcxNWRVJ
 3hJgsEPCYpkzR7RIWrtxJfE3yTQPyReJOXhUGnJlBXyQ1qW5QHqSyCbVQEAAA==
X-Change-ID: 20260320-exynos850-ap2apm-mailbox-cff0c8d69898
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Jassi Brar <jassisinghbrar@gmail.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3

This patch series introduces support for the AP-to-APM mailbox on the 
Exynos850 SoC. This mailbox is required for communicating with the APM 
co-processor using ACPM.

The Exynos850 mailbox operates similarly to the existing gs101 
implementation, but the register offsets and IRQ mask bits differ. 
This series abstracts these differences into platform-specific data 
structures matched via the device tree.

It will be appreciated if it can be tested on gs101 to make sure that I
didn't break anything.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
Changes in v4:
- updated regs, masks types to u32 (as requested by Tudor)
- device_get_match_data() moved to the beginning of probe routine
  (requested by Tudor)
- number of channels selection moved to driver data struct,
  added description for that field, data->num_chans is used in probe
  (requested by Tudor)
- new define for Exynos850 is added to hardcode the number
  of channels
- updated trailers via b4
- Link to v3: https://lore.kernel.org/r/20260429-exynos850-ap2apm-mailbox-v3-0-8e2719608c46@linaro.org

Changes in v3:
- exynos850 dts change is split out to a separate patch;
- updated commit messages to a proper name AP-to-APM;
- added comment "ring the doorbell" right before generating an IRQ to APM;
- renamed regs callback names to intgr, intgr_shift, intmr, intmr_mask;
- Link to v2: https://lore.kernel.org/r/20260402-exynos850-ap2apm-mailbox-v2-0-ca5ffdff99d4@linaro.org

Changes in v2:
- dropped clock patches (they seem to be merged);
- patch 3: updated commit description mentioning that
  exynos850 is not compatible to gs101 mbox (as suggested by Krzysztof);
- fixed comment description for struct exynos_mbox_driver_data
  (reported by kernel test robot <lkp@intel.com>);
- Link to v1: https://lore.kernel.org/r/20260320-exynos850-ap2apm-mailbox-v1-0-983eb3f296fc@linaro.org

---
Alexey Klimov (2):
      dt-bindings: mailbox: google,gs101-mbox: Add samsung,exynos850-mbox
      mailbox: exynos: Add support for Exynos850 mailbox

 .../bindings/mailbox/google,gs101-mbox.yaml        |  4 +-
 drivers/mailbox/exynos-mailbox.c                   | 72 ++++++++++++++++++++--
 2 files changed, 69 insertions(+), 7 deletions(-)
---
base-commit: b9810cd75b9fb56a3425d391cba3f608502bd474
change-id: 20260320-exynos850-ap2apm-mailbox-cff0c8d69898

Best regards,
-- 
Alexey Klimov <alexey.klimov@linaro.org>

