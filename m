Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151F237267E
	for <linux-samsung-soc@vger.kernel.org>; Sun, 13 Sep 2026 22:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789339070; cv=none; b=ZHxeth5t/E32OaJj8PHOhXyFSF4+/ZYxA8whHJMNdk+oejloPIfmdLXXwBvRk8PkZzApYvTU1pzdmtxHdlVtpeVR6PccwDXlNj1H0ynbAm+KuZQudEugU+KeMEkxULPcCpwnkEG19ak0yz5u+n/zmNbS9CHkDGRx+x9ClA730VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789339070; c=relaxed/simple;
	bh=3cg8XnTyeUr/ZNUKpH7NMoYPPDGllIHKIhed8WWuR2w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CX0idh6fNL2Z+hA7jvqHxDyg/MNLlgYVX61xX2CeCIcJBUCTDR8V/6BGHy5xP3nk/rxTy+DymDA2syJ34nhUViqA+SiuN6x4Ow7k7Ab5twbGWKLUm0oJchAV6yPrUiOXGKgyMJFcp8qXSW6QzEfZ0CMo7/FLygGVT0pW39RVuok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sb1y03cK; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sb1y03cK"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfcb5cb1so21411666d6.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 13 Sep 2026 15:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789339067; x=1789943867; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NhSRUlqeyUz4yTc949Je7U72nl4ZdEKUBnpeXKWqOoQ=;
        b=sb1y03cKamhDTdGQo93p+DOzKIs+ld67d+BKxRqrNl7PbvuGAUNpE/XyE6CvHO6sp3
         ueD4Pl9nqxyjNvFqSrCOcjA2n3d1hoh98yX8b1CGZiK/0grSAMvJxpjhSFjLyqmXafL1
         l0fQeshKYJlzD1f48AcN0W6pG+KRXnDrPUWRAHAqsffm8CBij3h1/xGNB9amnlg9DWvN
         e7itB65SqEeuzPB5TCn/+vY84e0wY7qUw/ejuAyU+AJJDnPG32XR7J/s3U4dhSgZsMQ5
         Cxu2UY7q7Ndy10mGE6OGEJpVNk2blmUqDJsl7dQ9uTaY2AkAdK9zZLKrbIV4iXGKfphC
         EdVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789339067; x=1789943867;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NhSRUlqeyUz4yTc949Je7U72nl4ZdEKUBnpeXKWqOoQ=;
        b=D8KDS79bRv1lPqHpy29AgBDjpNUxFh2G5aitAk5WwPLSEPqr7s2jE3+PPLzhsqfxSi
         eUajJJBYasr6/bGjRYiyzcz1mC3AMtlXwVHpc8kNwKHKZcPXA8Jmm+V+pxFf/Fbepo3m
         p4UykcdfJaTaFGppLrBfK9jfhNVFCMIVAthlYXFGA6x+qS/+sf5xi3iKxkbte3ia/T6H
         S/TbdjbKK6fGKYjPdzcaaO8g01mNz+LIpdNM/VZGjgrhutsq80VbiPYrICCsck7znIFH
         KjXviGQXLBnxWlGgGiX2VkCJafnSldN8uaz6cMbnvNqk91bm6ZeMOPzYa0YVd3F67rMx
         yoAg==
X-Forwarded-Encrypted: i=1; AKwUvBydW0nmZPJp/nnY9cpjZQ2ZzzEc/DwxIAwkn2iJZH8HwJt7PdFsAoseGA2f3CdhFvlUFRzC1HO4eU7kDb2bHdV1AQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mpDTSFbDJXaSmscdi0WWxgw7I3lamyTZ2KWT8myipLxcSIPMan
	ESBvcTwD8Qte7xYrPvQXmc3F6RkvXI8qIVuDL6zwgu3dpbhtgctidig=
X-Gm-Gg: AYBFou0f0fVTKHvgeRFsPin+zLT3La9DlReMsWnAmBl8MxgpvOI0zkqlvDZRhlrZlsK
	ILnghUP6omqCwFWgwmdgi54wAYlN7Lnx5yG3/Al6l7r4JDFcA3m+mA1lNiT+963GKeQNmuZg7IX
	nb/IiqkKtq3qh71XjtWIHpb2HxAvn5xv9ppEWa1ZeXmSADNLt47uIsgk6nYkbxoh6MzHi3f3KKY
	VyhqYRdRzmbB7BSTRgKilHSUD2+uGvKon+xOEQeOzJcyXpcPIG4p4R3A49H8ItcRjQYc5jFJxz2
	Akx0VNT5U61mjTV4dYIpy5bcVLwOIsBqVMk5/Ax1q6nPRo0lZHjJG3mOdfsmxxpNie3GQFteaSh
	4c0E/Tx6GpgO+LP3+S92AkZMQHKvuRy+3Grf/wduZWb5VswHlVrYaVfT2JruI+A6dXuS3qVasqe
	Z9qmc0rQM8CnY7QlxE5D5KAqsdM0BKkIfObE224tDgXIrlxcJypaU2F2orL8mYIm/KRk6y95+p/
	FWzU/eMyJvr37kF4/sVaEgiSUooIHC2GA8SGn0BrPTKn8hvxzrKPybPmVfOLFNKx8ZM3iwXFCBX
	E8Le+rMixZ5B+V31NJivFzkS3solbXdxYg==
X-Received: by 2002:a05:6214:4117:b0:907:bfc0:781e with SMTP id 6a1803df08f44-9122e55673emr2317736d6.30.1789339067037;
        Sun, 13 Sep 2026 15:37:47 -0700 (PDT)
Received: from localhost.localdomain ([104.39.73.78])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f45cbf2sm79361056d6.17.2026.09.13.15.37.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 13 Sep 2026 15:37:45 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: stern@rowland.harvard.edu,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	krzk@kernel.org,
	peter.griffin@linaro.org,
	alim.akhtar@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH 0/3] usb: host: Disable controller wakeup on removal
Date: Sun, 13 Sep 2026 18:37:29 -0400
Message-ID: <20260913223732.92882-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These three independent patches balance the controller wakeup enable in
the generic EHCI, generic OHCI and Exynos OHCI drivers. Each disables
controller wakeup after usb_remove_hcd(), before releasing the remaining
driver-owned resources. No shared USB core behavior is changed.

For generic EHCI, a wakeup-capable ACPI companion provides the capability
setting through acpi_bind_one(). For the two OHCI drivers, ohci_run() sets
controller capability when OHCI_CTRL_RWC is present. If probe successfully
enables wakeup, the attached source otherwise survives ordinary driver
unbind because the controller device itself remains registered.

This issue was identified during our ongoing static-analysis research while
reviewing kernel code. The patches and explanations were prepared with LLM
assistance.

Compile-tested only; no hardware runtime testing was performed.

Myeonghun Pak (3):
  usb: ehci-platform: Disable controller wakeup on removal
  usb: ohci-platform: Disable controller wakeup on removal
  usb: ohci-exynos: Disable controller wakeup on removal

 drivers/usb/host/ehci-platform.c | 1 +
 drivers/usb/host/ohci-exynos.c   | 1 +
 drivers/usb/host/ohci-platform.c | 1 +
 3 files changed, 3 insertions(+)

base-commit: fd73f4a6659897191fa0d40695fe370925dd3780
