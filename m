Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F1719DF6A
	for <linux-samsung-soc@vger.kernel.org>; Thu,  8 May 2025 05:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746681103; cv=none; b=fQoB3F4ldOrzmqxwxL71/mWqnRb8JlVXf5eCN0tpysymf8ns5yIaDa+IJ0FF9+A05WC5MezV7++LM+0IzzOefYClJ2sgnb0BHl5cTQsbe6hx+U5Q8kuq1Tz7HOKjbydnX0aKaig+2Z9JUt0KKPREz7L2Grrcu4X9pmq0+l0fpLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746681103; c=relaxed/simple;
	bh=AQuEWPjekhThkflJFV9dZKxAkJmiFPkZ+D9N7nJgnOY=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=STnoEk8BSXCT7Uxng0bfMoKW8YelL8n3FLQPaTsEBGmaahfRQit9e538PjFveMh2fcgZr7kG7Dbe4JRgvkUxFVg9e/V+AhWxAGY4qaAaB+suHUu6CevywY0kK4uImbXsZQDKeN0rgKbZJKbtP8uV2N5/EMB62kTjX3BX5WX4oYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--amitsd.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uusqgq85; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--amitsd.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uusqgq85"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-30ab450d918so995196a91.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 07 May 2025 22:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746681100; x=1747285900; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+objnduDEdA6XgtoHIMnhtVVZlrAlpTMhfHb5uGFsAo=;
        b=uusqgq85fZK7YMtOQd/EhhX5EO6PRytOwuUo4QpRjxRrFI/ItckZ3M0RYZmwwwR7xj
         DbQfrKNX6oZXxbMjBdBbtp1FtK57uZzvY74KiLMW1dfrHyU1yPjBOETGxLqVAg/dqZtE
         duurueQyr9IAHkypH3UrjD+i4LeHVMUbREFnfgnSQtqJXxkvksWCKD5SY4YXNwHcueE/
         rHsQw3LeAy4f3kiJA7ec+CfbAONW9PK+7l8dDDyoc59sgA04mtXjGfabuktn58VsVfpI
         BZt3Xj3kShFjLwcsxhbhI94DiEzpYfvyPGapJ3JVnc1/O/4+3j0TDdnr51NJauvwyg1H
         3LMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746681100; x=1747285900;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+objnduDEdA6XgtoHIMnhtVVZlrAlpTMhfHb5uGFsAo=;
        b=GmxvloA/NH2W2rlA90fK1B2kJ0kGYIP6aFIYUFZMPvvW7QkYbX55SvsGwHvZnQRSCe
         DEjL7LRAOqqsl8wVUCLOa4mQzhS1xgD1XbL6f3ZHm8OTnpfWhuu6AygWbdiwJHy8K+je
         cKAa9nawNvJnWY+JjLpe8YGZvCZCHnyHNmofOhy/PCf72HMMTTE26WZxRM2IQRa9isrI
         SraznhgldnyqKpwb0dW3aORuE+HulE0GjZ6AM4PFfR/4Wy2MOjCVPI/YEqHdJ4/LKBwl
         eEU0BYua8j2Tw/WOJ5FIDXFScDWD+k3A7iwPq0mn0+jLdhgQuFPt/jX9FDfnVQBS5IQ7
         WRjQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5kLr7SRqsBB6Ncon4DJ6zE6R04ASn4GjAXsaqcwjFkl5GH+1ECkRhmDZCZN6AtJ20Ed28A0dZBihrHz7Dc7fBVw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4C7YJxJStRYfoHjLP4irCKbHrxwh/xoJkc2yYaEHyYLQfSQW7
	7FKVRjha/Ns0kdOU3RLAQOtjp4dNzpudheLgrNpX02w6KoGQ8k09e+PKRgazRiTDgPThEFtNuvV
	g2w==
X-Google-Smtp-Source: AGHT+IGGonQAPWDxdBzLe2Ueqgy+uFD50vWf7E5zkm1R2s+R8YnCic3HHOe1DuE+B2Hm8cJPIF79XW+rfBQ=
X-Received: from pjj15.prod.google.com ([2002:a17:90b:554f:b0:2ef:95f4:4619])
 (user=amitsd job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4a89:b0:309:fd87:820e
 with SMTP id 98e67ed59e1d1-30b3a6d7b70mr2372936a91.26.1746681100133; Wed, 07
 May 2025 22:11:40 -0700 (PDT)
Date: Wed,  7 May 2025 22:08:50 -0700
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.987.g0cc8ee98dc-goog
Message-ID: <20250508050856.674782-1-amitsd@google.com>
Subject: [PATCH v1 0/2] Add graph connections between tcpc & fg for Pixel 6
From: Amit Sunil Dhamne <amitsd@google.com>
To: sre@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	peter.griffin@linaro.org
Cc: andre.draszik@linaro.org, badhri@google.com, tudor.ambarus@linaro.org, 
	alim.akhtar@samsung.com, dima.fedrau@gmail.com, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	Amit Sunil Dhamne <amitsd@google.com>
Content-Type: text/plain; charset="UTF-8"

max77759 Type-C controller supplies VBUS into & out of (depending on the
charging mode) the battery in Pixel 6. In order to represent this
relationship, we use graph to connect tcpc & fuel gauge.

Link to USB connector binding that this patchset uses:
 - https://lore.kernel.org/all/20250507-batt_ops-v2-1-8d06130bffe6@google.com/

This patchset depends on the following:
 - https://lore.kernel.org/all/20250421-b4-gs101_max77759_fg-v3-0-50cd8caf9017@uclouvain.be/

Amit Sunil Dhamne (2):
  dt-bindings: power: supply: max17201: add port property
  arm64: dts: exynos: gs101-pixel-common: add graph property to connect
    tcpc & fg

 .../bindings/power/supply/maxim,max17201.yaml      |  5 +++++
 .../boot/dts/exynos/google/gs101-pixel-common.dtsi | 14 ++++++++++++++
 2 files changed, 19 insertions(+)


base-commit: 92a09c47464d040866cf2b4cd052bc60555185fb
prerequisite-patch-id: 74aa0a6fc4a5c56d870bb15375fad1fe41ffc1e9
prerequisite-patch-id: 46f968300dcf5442e12d882ca23168494249d378
prerequisite-patch-id: 3ad83a2782819bca215bb267d36a1ff04fe557b2
prerequisite-patch-id: 86b5207d8f44255c36b1e600ecdf4f948c5da685
prerequisite-patch-id: a15532888ff2572696d9fa6a14775e8ebf590391
-- 
2.49.0.987.g0cc8ee98dc-goog

