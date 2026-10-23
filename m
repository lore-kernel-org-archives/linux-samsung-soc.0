Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792799679;
	b=vOg2EXQtZFE6TAwa7NiYV5jJF2NZRbJu1jxWFpSEjTL+Kio5YFNTfvKFxAxcCaaCg+UO
	 dzVQzr8CXNzYG8N1xgO2nteRhRmJZLbJJjVLTh6ay2K4/UAK4j1yK84zGG4IrHwyzZKhM
	 g8YOVc/8aWbmS7pm35mc6bFctQBvdQi21dY4cvsRVHzhxSRurf+8SAHz/tH+88EENULZv
	 h3pAr+duAiz8Ubmia/DoH+rjniYJq4JsGYgwZtsLabVm1kAALwhZujLB2voJYQsKW1sye
	 C8So4Iviq2r2ZAbM2HvfLzdN8NHDekWeG63Ky2dfSr6g0SrwoyeEyMB8ca+SfwMZSkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792799679;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=WyWU9QEly82UAo6bEoWPREDKCLnVhT5ADM2LPpXyEAo=;
	b=YjtvOzY7CTMrHeT2b63kjqo2ElR8Wq0iISzETx2ea4RE7YDgDEONcZhhzaglC7HBnVuZ
	 8qal11u1ey8kgjlryl0k0cE9XUs6HrfRq+u75OinI86HWM6TvUeSoSQetjYvULnzMhEtk
	 Web8McGdxR7Lv+SGA0WfSXZMRvDZDGbp3H354xRXYhYThOSBUai+w/g7jcWmdDBfx6lzY
	 BKcPFQDVKFDRT7H6ju6v8ruLwIOmvg4OypHBXBZE5iWHKFigHZOGKZpRuIw46G6L4GVqX
	 e+bOnes8TXByG7cw+NPCUgTu2B2VT6kr8VGCtv8gRv+j/FTEF1lPA2kjHWeG4hSRPiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="eipMIJF/";
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A52606A322
	for <linux-samsung-soc@vger.kernel.org>; Fri, 23 Oct 2026 23:54:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96A52606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=eipMIJF/
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3282db206d3so1652156eec.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 23 Oct 2026 16:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792799678; x=1793404478; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WyWU9QEly82UAo6bEoWPREDKCLnVhT5ADM2LPpXyEAo=;
        b=eipMIJF/+KiVQoBZN+1mDNs4jpn5iVKTQzVaOmEwNVdkZv//EFYFN84Vr/Rp+XGnqO
         VAlB9tdAUPkCE2Z2mD67sGfMsr0V0D5DI6PwjFTZ4LZJ68ZOQ4ThjufDPggiftsXLg90
         Lb55duCnTzex3vdlmqcdestl/quKPw25iGd0g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792799678; x=1793404478;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WyWU9QEly82UAo6bEoWPREDKCLnVhT5ADM2LPpXyEAo=;
        b=giFhEvdpGj5+ZtnpFcDr45vqqFL/ZNI3sWm4Gijj8NTFIJSsVbPesNUDrYVE5J1WbD
         9A+pfRfL08X++5QHMsnTZt1Kqiv7HPMeboUo1j1u8uV7SWdn/rVHZTHzWLrLNtV/Vh+a
         nyi8cuxl/GEHhjtpmk0axZl534Q/CmT0iTSfRPVuSarIpHQn1CU++LDqdKKUz8Mokbv2
         VUMTTMZ/a3tn8+8ABOtWhyJ6C8lGM5Gwo5d2s/4v6IcP+fE4hvws7Dy5WbpcwbZ6E7CB
         GEmFwxNm75WVu/k1NmXEtgcewQB2RZ05sdgSkuj8v7y7c2uZ7gFfE62ubKb/HDzLGj6t
         Zyew==
X-Forwarded-Encrypted: i=1; AKwUvBxwgwetz7a8Xemj4NUaWZmi2cx+KjaoxZBXvSvh2ySdnwWaauS2aqeeUAn/1vk+wx3WQVREie8VGhtsh4FIODrTpg==@vger.kernel.org
X-Gm-Message-State: AFq9FYLH34cDH3HEsIP+fwV16j6TOZ9eaRpwlIwvMRHF2LoJ7tXEf4/t
	uBCNWst0hF7nuprWwfSTT+LJVbPtHzvX1t+KsSjYTEMni9C200zt1gaWxT49ks18+w==
X-Gm-Gg: AYBFou02WVsHL7DxN3Pnou3nHmG8kxTed0ESVl5eboZK+TUpJrB1CnFYpViD9kh1zGC
	VJQuXGqoy8uxwKFZ+LZ63UL0HitynfACCzFbH9nWjCJlLett+xox49QgvFJrki4YsN5CdhP2bfK
	c9mi0z5P4B/DPKRxBLMI+TesNWuxccKkEltQlNuz5fwlCrXAwrT/uF1hz+R6442DEXbypVs6XPk
	B5DNdxMLZQ7SEH3s4ChmIutLN+5PeyP0po1fjaQyNdEFevBTAeYyJE81c9mSU+h92bXUwHbYXqo
	gkAQdjkyAMXPxcAzRKIjTRsqqgWOt0Kilcmq++ILrDuhgcL+7ypv1YCjVlszDQ7ubhYLZlC4ET9
	F0WlPw27nZB1ZsFO6lahfjf1Ih5Wxr9JhXSkahVCcW5tdAa9vVShzdBFEkUbft3mCRNLC7v5jzH
	tcwyASUDqYf97Ei4RGu040hhzEOztVET6K1wxiOFmB3RBciWdCvSdEPFqIbPV+iWopwCtE7o3dV
	eI+2M5HqdbZqhR8Ixywws30bizIUpywzYy/y43BXdc+U3qL1kIkdnGs9SL+mdv2qfQ2QEwdJfce
	UDsG5TZalPat9NkbwgfriYSsqc4my/T5FDFz6GG5
X-Received: by 2002:a05:7301:1694:b0:366:eda6:8dae with SMTP id 5a478bee46e88-369e84b9a3amr1401168eec.18.1792799677639;
        Fri, 23 Oct 2026 16:54:37 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:f8c2:b3aa:f878:2faa])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8daf444sm1460608eec.18.2026.10.23.16.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 16:54:36 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Joonwon Kang <joonwonkang@google.com>,
	Subhash Jadavani <sjadavani@google.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Lucas Wei <lucaswei@google.com>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Brian Norris <briannorris@chromium.org>,
	Douglas Anderson <dianders@chromium.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH v2 0/4] mailbox: Improve the mbox core then introduce the goog-mba driver
Date: Fri, 23 Oct 2026 16:52:17 -0700
Message-ID: <20261023235408.3063350-1-dianders@chromium.org>
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


The goal of this series is to land support for the goog-mba (MailBox
Array) IP block that's present in Pixel 10 phones.

As can be seen in the device-tree bindings for the goog-mba IP block,
the mailbox IP block in Pixel 10 phones is fairly sophisticated.
Notably:
* It has hardware features that support queuing, meaning that more
  than one mailbox message can be pending at a time.
* The "channels" in a given mailbox array aren't homogeneous. Each
  "channel" in the mailbox array can have a different amount of memory
  for messages. Really, the "channels" in a mailbox are considered to
  be full single-channel mailboxes and a grouping of mailboxes is
  considered a "mailbox array" (hence the IP block being named "mba")

In order to cleanly support `goog-mba`, improvements are made to the
mailbox core to allow `#mbox-cells = <0>` without a custom xlate and
to allow mailbox drivers that have more than one sub-node (`fwnode`).
For TX queue mode, as suggested in v1 review, `goog-mba` exposes each
hardware queue slot as a virtual mailbox channel rather than adding
queueing support to the mailbox core.

This is a fairly big rewrite from the downstream MBA driver shipping
on Pixel 10 phones, which jumped through some awkward hoops because of
the way it got queuing to work. It has been tested on a Pixel 10 Pro
XL (Mustang) together with work-in-progress Laguna CPM, pinctrl, PCIe,
and RTC drivers.

Link to previous versions:
v1: https://lore.kernel.org/r/20260714222338.2965707-1-dianders@chromium.org/

Changes in v2:
- Rename binding file to google,lga-mailbox-array.yaml.
- Drop generic "google,mailbox-array" fallback compatible.
- Add "google,tx-payload-words" property for queue-mode TX message size.
- Remove unused labels in DT example.
- Drop "dt-bindings: mailbox: Don't require #mbox-cells to be 1"
  (handled by deleting old mailbox.txt and updating dt-schema).
- Drop "mailbox: Simplify circular queue math with mod arithmetic" and
  "mailbox: Add support for mailbox controllers that can queue".
- Expose a mailbox channel per TX queue slot instead of adding
  `has_queue` to the mailbox core.
- For queue mode, read `google,tx-payload-words` from DT instead of
  detecting TX payload size on the first transfer.
- Match "google,lga-mailbox-array" instead of "google,mailbox-array".
- Move MAINTAINERS entries under GOOGLE TENSOR SoC SUPPORT.
- Use guard(spinlock_irqsave) and scoped_guard(spinlock).

Douglas Anderson (4):
  mailbox: Allow #mbox-cells = <0> without specifying a custom xlate
  mailbox: Find a matching mailbox by fwnode rather than device
  dt-bindings: mailbox: goog-mba: Add goog-mba mailbox bindings
  mailbox: goog-mba: Introduce the goog-mba mailbox driver

 .../mailbox/google,lga-mailbox-array.yaml     | 226 +++++++
 MAINTAINERS                                   |   3 +
 drivers/mailbox/Kconfig                       |   8 +
 drivers/mailbox/Makefile                      |   2 +
 drivers/mailbox/goog-mba-priv.h               | 130 ++++
 drivers/mailbox/goog-mba-trace.h              | 183 ++++++
 drivers/mailbox/goog-mba.c                    | 621 ++++++++++++++++++
 drivers/mailbox/mailbox.c                     |  16 +-
 include/linux/mailbox/goog-mba-message.h      |  38 ++
 include/linux/mailbox_controller.h            |   4 +
 10 files changed, 1229 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mailbox/google,lga-mailbox-array.yaml
 create mode 100644 drivers/mailbox/goog-mba-priv.h
 create mode 100644 drivers/mailbox/goog-mba-trace.h
 create mode 100644 drivers/mailbox/goog-mba.c
 create mode 100644 include/linux/mailbox/goog-mba-message.h

-- 
2.56.0.257.gf7497c7d27-goog

