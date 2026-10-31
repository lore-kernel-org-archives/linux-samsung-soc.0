Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793450360;
	b=TA9cQt9UtDEsF59cOc0M8y6gDuuZUu3nntQTxpilxRINULtvVYhhg4D3bvQhtGEwTrD/
	 EyamBJUwyl6IjAijvUKWwfVJdYPiFDO1rdCrg/i1Mg2aInFWF3uOw4HvYKapXwKFnZrhf
	 uEBYusH/rM7JS9wigcLU0TOefjqETk7DxvmD8ruFpevVJSR+0rgzaMgK2flLwYMpeXKoV
	 MEMMgjuFVQE6QZmrCp5FHoj+mlj/GyQdTi1WjqzAzxiG6DczXf2IDjhpEiFuwage/aK7b
	 eQgnGVd5QBo6hIn1KtiM6yGWE7v1k7gqkM/VYP9OpqEvijTBPltV5fVvl5+Q2OdasTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793450360;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=p+SP5aC6kFf2m6+Y0UAcy1XbuoZimqxQ+Qboov/RQdw=;
	b=09RhsfqBIzZJzC89tgGEdK7Azdqohp18UXXhsuI9nzXgArsCLY1lCKeRjWE6fZt/ZZvU
	 ZukjULR0wMIKSfDK/dyq0RBBJ5/ESG8YWlWs9RUda84F+CkOQuXEE5ays8Z2iND46cTP0
	 s3QQF1HxkCcfbdyB2ej4q0DdlIu/lnXGOBxgiu5tEgjfIe+pCmTTjCCYEmyp3JaYpnPTu
	 ezcDZRMWVrGiL54s3rNaABX3I6VyWyJlDxn0dmHzhdhfPtod+pqIf6Dj5uD55IfIOqndJ
	 423Ztjo7s0FSH3wpBPJY+4LLtKUGj3x4A0S18EzIa59XVFBf7f96JWgJUEOTIC/DEfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xKL4FZYZ;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C04606A322
	for <linux-samsung-soc@vger.kernel.org>; Sat, 31 Oct 2026 12:39:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68C04606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xKL4FZYZ
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-35829219da8so3139584eec.0
        for <linux-samsung-soc@vger.kernel.org>; Sat, 31 Oct 2026 05:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793450359; x=1794055159; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p+SP5aC6kFf2m6+Y0UAcy1XbuoZimqxQ+Qboov/RQdw=;
        b=xKL4FZYZxZ2DMFO63mud1fJJvL8ljHKd1cSzKueTBjZ5KWdT9ssOnP0v+oXC+Q0hZo
         Qs+PHJ9Klrp7eA+ZXpy9jf3Dvec5+bt97LOlRXjZ2Q/ZQk3duWOE8JWGvfSgl57vgWch
         JCwhFXX9MgJGW590FuwNWfZumZRtLkpFT5T7+6Bz4lAo+aIOdOUI37/Kc3CAmRyY4HcK
         W41yN4QDz1O5X8AHfcEF+5+xoVAARl8Hp+FsH+KuRBB/WuH0FK/KGowokkDV3UY6/ekT
         v7y6LWO5F42Vjer5ob4L76hFwBAGTlmtyimH5jt8uYFW8EL+iFHLnr9Tu8b/QEml5OWf
         mHPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793450359; x=1794055159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p+SP5aC6kFf2m6+Y0UAcy1XbuoZimqxQ+Qboov/RQdw=;
        b=ifiTotEXBByunQ/phS+anDVYzoxDne4XSPnBHQCKw8VA0eEc6+jJjC4habUDu5j/F1
         jQh1a5nP/+ZGSwuIDqSH7XxUCtLNUh7axr3qZY27dPzjpmYUNjacFmVAVrnGPm8p8/qc
         1XwWvbOczqR9mGqfs5Sd93ptQWiTqq6/OdOTYdz241L/ggreYLGGt7DmKmdeJOa0XblI
         P9+FDI1idCAyCkpyN91MrlTSCur4mW2LuxKPBfua7qWXU8/tNYzh/NzUc5yy34kAMmCy
         sHZJoerUfnyGiP4+oIJJS8/L+/heXiW+MTT7Q/wGmvM+Hu6SRv6EcauRJDbOB5+gAFvZ
         lXhQ==
X-Forwarded-Encrypted: i=1; AKwUvBwsA0VUeRE2xaCUuAnC+GraKMQrxfDmQerbm8ngbh5XBNJgp1+oej3cH/YW/44a4Bq7aiUVt4YVjYcpOY62LM4xoA==@vger.kernel.org
X-Gm-Message-State: AFq9FYL3CE208mtkp0HOGbAu5Cr+SiE8vaRUOuz9JIYFtUlG8TRZU+SW
	DutTUZ4hXNyjdUb693xY3mShezoc6UnaUxHh9pdh7TgK+/v3xtLYfwPu
X-Gm-Gg: AYBFou05bJWYI7YmFW5ivDngMrxQX0vAtnJOOVpCPEoUr/DlrUMflXWSejaUI3BgDHl
	BVNkl54IoQguL/fyqfuQZLYxJKSnKrBOV6JEVQodnff/c5fNVvb7wx3mXYet7JE74gvr4kbIate
	8LLsp4qyHk7qdD44At3Zal9m+8+TVxcQOwQ/yQnwJrCQ2jnK8bNc9XE1ty+AdWH54j12TCOpFWD
	r3X3itw+r8VkjAt8CH0P5aSMuo2VHorjxjhYBdJkSoUThTtMl9+dmKi1B8sv7TMqowARZZy429M
	ETy1uzvFXL8VKPghZFlh/YM4oHVjhCv8jd3DdF6hV9PPG7FHFzfavG/2WojbYIgH2fh0Z0K3XI3
	5QtL7lynAicpw8V2JS3akXDvIph8GNXwdCd0maoWGtLSOgyYb7dp+aOzJAToi934Fr6287r3VLq
	gPWc21lC6G1lC0Aah/gqk3yLZxbZxM7grYy4o0Y4Y45vGItBGQIkmq5Vu9njSVyIabxDhCfe7Ge
	52KFlRC6/MOv757CA0JVbtAb7UKIiabK4aJR6nG1QWyHqKfBEuNCGAnhNvLUkJU2u/44iMxeIfu
	aJoEZY6+YjJzQ+Z4/UO1SjHMg8h9KxcYCSHgJd1tyjJRSDdqvdTOUTQyxZDWE6aQGrqOv8LH6tN
	mCMg7o69OY2KaxA4tTu27Ki3YM2JBzpWeC4kV2oWhQlmVOHU/YEzC+oRPEOtAT4MkgfLkgDPUkK
	CCr5KHr2QCd2R9vA==
X-Received: by 2002:a05:7022:f507:b0:1ab:90a8:87a2 with SMTP id a92af1059eb24-1ad1077e9a6mr5123543c88.11.1793450359362;
        Sat, 31 Oct 2026 05:39:19 -0700 (PDT)
Received: from brev-9gdpyq8lp.ap-south-1.compute.internal (ec2-3-110-210-194.ap-south-1.compute.amazonaws.com. [3.110.210.194])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1854da78sm21566039c88.6.2026.10.31.05.39.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 05:39:18 -0700 (PDT)
From: Samarth Narang <samarth.colleges@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Samarth Narang <samarth.colleges@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	linux-serial@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] serial: fix TX kfifo underflow on flush in five drivers
Date: Sat, 31 Oct 2026 12:39:06 +0000
Message-Id: <20261031123911.3784690-1-samarth.colleges@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261031004733.3345841-1-samarth.colleges@gmail.com>
References: <20261031004733.3345841-1-samarth.colleges@gmail.com>
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series addresses the TX kfifo underflow reported in the parent
thread, where uart_flush_buffer() resets the transmit kfifo but a
completion callback from an earlier DMA transfer may still call
uart_xmit_advance() using the byte count from before the flush.

The fixes take two approaches depending on how each driver manages its
TX DMA mappings. In samsung and tegra, which map the TX buffer once,
samsung's new flush_buffer() terminates the outstanding transfer, as
tegra's already does, following the approach introduced in 8250 by
9e512eaaf8f4. A completion already in progress skips the kfifo update if
the transfer has since been retired by flush_buffer() or stop_tx().

In sprd, msm, and pch_uart, which map each transfer separately,
terminating DMA there would leave the flush hook to unmap a buffer the
controller may still be reading. These drivers therefore leave the
transfer running and mark it as flushed, allowing the completion
callback to unmap the buffer without advancing the kfifo. This means
that the data already queued for DMA before the flush may still be
transmitted.

All five patches have only been compile-tested with arm64 defconfig and
the relevant drivers enabled, including pch_uart through COMPILE_TEST,
using W=1 with no new warnings. I do not have access to the affected
hardware, so testing by someone with suitable devices would be
appreciated.

One race remains, which is also present in the 8250 fix: a completion
may already be running when the flush occurs but acquire the port lock
only after a new transfer has started, potentially mistaking the new
transfer's state for its own. Preventing this would require tracking
individual transfers, for example with a generation counter, which I
have left out of this series to keep the changes focused.

Samarth Narang (5):
  tty: serial: samsung: fix TX kfifo underflow on flush
  serial: tegra: don't advance the TX kfifo for a flushed transfer
  serial: sprd: fix TX kfifo underflow on flush
  tty: serial: msm: fix TX kfifo underflow on flush
  serial: pch_uart: fix TX kfifo underflow on flush

 drivers/tty/serial/msm_serial.c   | 19 ++++++++++++++++++-
 drivers/tty/serial/pch_uart.c     | 27 +++++++++++++++++++++++++--
 drivers/tty/serial/samsung_tty.c  | 22 ++++++++++++++++++++++
 drivers/tty/serial/serial-tegra.c |  8 ++++++++
 drivers/tty/serial/sprd_serial.c  | 24 ++++++++++++++++++++++--
 5 files changed, 95 insertions(+), 5 deletions(-)


base-commit: 36aad21d50d1af3f6954bb0c988257a908202477
-- 
2.34.1

