Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793460429;
	b=R6Z2gqmVHjKXo1+CVyvccr3q+tI03PG61cHDsdSeAbWpqq6/OD8rZ7iudX/uso5NPAwN
	 /O6uozrKhoDDE8H1PMxCpIKqxa8Xuw+NM6rEkA2ptYyveCLyfUBdKkfamyQ5tzdSG2j8a
	 VkP0xvYw7bvnZLDpifYQb6KCZFmnyBrsakk5e6uze2iYM9xsE63gPUyNuMX/BoAVjj0Ve
	 zcCbRYO8OBPO19Y2fDqrk+CTCrtr4IZIlstd1j4Ofm1QW/M33B0pSA5XAEHWNR+G6/jNz
	 /JpTeEOs5wQFifZGDaycHZTWRrV/RtbBZupkE564iP0Q6HzLcYHNMSrusrXwBXovG1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793460429;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xTNa3CisyEifdpOcMGd1ZFRXYvZSpSVI/VVxCfsYBaI=;
	b=rACfSONTAqisj1BMzB0tQYX5kZqfXgs2ie3vKfSP1VUy/N9ZJn0qP7Zi48AdssDOBAso
	 Y/oqosUdRNSaseDEk5zUHzWOvIDARJzj+Ndt7T5W5obW/ZgDZ76YEuITGPdmaNfaG7EBv
	 3Iz75xv2z92BVkdRyriFvKnxP8X+FTFOF3k1kLqEIR3HuyDjMHNgN3MCzFQD6LwhG0+ey
	 LWq0KkajpfAivSVIs/BQGFyuGfe+gG+y6YKLyYO6HabTfdIDClraQIh3Qw0vaIKlCe5wk
	 Vj/O7T6S1Fx4aRg15s+Chqz6dmV0lEPLFFvv38aRqoErxBZ+YmfliLn3Ss95Te7Joxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MWXe8N0b;
	arc=none smtp.remote-ip=74.125.227.134
Received: from mail-pj2-f6.google.com (mail-pj2-f6.google.com [74.125.227.134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 462EC606A31D
	for <linux-samsung-soc@vger.kernel.org>; Sat, 31 Oct 2026 15:27:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 462EC606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MWXe8N0b
Received: by mail-pj2-f6.google.com with SMTP id 98e67ed59e1d1-3ad41dad3faso1116427a91.1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 31 Oct 2026 08:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793460429; x=1794065229; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xTNa3CisyEifdpOcMGd1ZFRXYvZSpSVI/VVxCfsYBaI=;
        b=MWXe8N0belkFGCTDLmOtDYvkv4S5/Wrr/o60zDaIZySzJ1rJDRGKyDGHnlV+YuzkO9
         8MY0JGsKKU7OR+YS/ayGOWtwIEox80KCmdXVLwJ18DDr+2G2Yujl7RaKIFQcNGGv07j7
         KhGerTpoHppHec6Y8JtjBGFq8ZyS3k+fmg1DoZNI8c2pf0uV0LJfTRl8pqiS9jJXqRw3
         x2Dlb9eijfKxvTcVrkcnIxlzpasIjll7zmtHdQc5p1UWltlzG34tILMiiPAdz7Y8joTk
         GT2OkvdpcYj9p1+a/pejwMlSt+Lx7dP7nwZG2X6oc+D/LJPasTi9tVys7w8JgJXEf5Mm
         gkaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793460429; x=1794065229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xTNa3CisyEifdpOcMGd1ZFRXYvZSpSVI/VVxCfsYBaI=;
        b=yXNidYXDYulj4JjIxjqHqKndmQb6z/hlHobsHoFn2UWlokedS7ihFccrSoYBaf9bbH
         SJ8oOLRYke3uFqKz5KMbNzx+XGD+/KtaMsTxUMG0st37tIMthgzRomCi87mGwMgprU7y
         Aethqm2khVZTZjsW2po+fU9euRhQwt2G6pxq5RRE9xE5iPRJY1bhTwWKiB3SPPnIvGvE
         q8vi5dtCyTGo+zBkYSy2AiSQ95I/WUUCDJApKUJam9u602DlUT3bQDhKR9XznqDCIvFC
         sXQUaVo7mBAHXQpdlzP6ab6pDW4IXNsLteL+iP7h+6ohmci3hc00A6e7JfxdaMxSezt4
         UA6Q==
X-Forwarded-Encrypted: i=1; AKwUvBxPIo52EAspI65i3zTUSUjlIMFLlJpABD4QgDciylH66zi07Pz3rzBTWO0qkL3L0NvzJvdSPhKFoco+F1MaScEdAw==@vger.kernel.org
X-Gm-Message-State: AFq9FYKMrEuoBJNxrSD6QtBPf07PHctYrdl93i4HDQHlqNOTmjVo3VY5
	PSwBa8tqr+DZDoY+X7g/yhxVFj2A7fxcKwRVDTREs/ZuDLmzRlc6APeX
X-Gm-Gg: AYBFou3rBZc1wAx/jBgqaWhNNoF3nVzznfPnDs3ziO1EZk8sJe4p+QDPXxKkAHelSAx
	40OFy0hQtscEZ06RpFRJ9yU16o3x4A3rhMcnKvcJD8NHGSfCl0nlPPiQ3krRkg/+RNTPzqnFJRq
	6cAagiixGfuJ2BQ1wpXu+pqklH9y5KdB73KLbt2Oub2sp5OEa4ao915T+B7dRvycPakRpSkJRZG
	ldBhP4RayVGKeR3bWTxq/shVy19Wfp/Migpru+gGo88kz7q/qJdApOY/tQxYqfPKXZ9SwiqpJvX
	YWZbDCrfEuWTWdao1ppU5xYV4JMxaJCPV1oC7xoPzHTumuZ4nRhfblKamGCE4FqJjwLm12C12M8
	AekUQGuvUhC6EO+F/2WePADf+MAHQc6QCXBxKol3wKkXngCZIyGnK3pInoZ6KbNjQ3WQkYMGSC4
	EquCIjrl8Y/tAoT1EpacFjYKDycVq1GEODQRkXUFbVb2rMQoiYf3vyXBK6tYtM5A2+Jwm0u0CNV
	Rvo1gMWBz/TfP6vwhmN1QCA28kSeyxHMzKboLP2Oa5b6mQh60+CjZ71a9dUJZGCRJd+TB7XEw9O
	ZCS62r2+v6FOOYow9gTzJT33mzdac2x6O9a29CoPCfY0Qmxq2zOY
X-Received: by 2002:a17:90b:534b:b0:3ab:4f1:4f76 with SMTP id 98e67ed59e1d1-3ae898127f4mr4404747a91.24.1793460428503;
        Sat, 31 Oct 2026 08:27:08 -0700 (PDT)
Received: from kei ([222.141.54.22])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb09615125sm1731025a12.1.2026.10.31.08.27.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 08:27:07 -0700 (PDT)
From: tianci xie <xiex16070@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Samarth Narang <samarth.colleges@gmail.com>,
	linux-serial@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tianci xie <xiex16070@gmail.com>
Subject: [PATCH 0/1] tty: serial: samsung: fix TX fifo underflow on flush race
Date: Sat, 31 Oct 2026 23:26:55 +0800
Message-ID: <20261031152656.1422-1-xiex16070@gmail.com>
X-Mailer: git-send-email 2.54.0.windows.1
In-Reply-To: <2026103122-repurpose-cost-2da7@gregkh>
References: <2026103122-repurpose-cost-2da7@gregkh>
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

On Sat, Oct 31, 2026 at 09:54:55AM +0100, Greg Kroah-Hartman wrote:
> Always just send us patches, after testing them, you never need to ask
> if you should do so.

Understood.  Here is the samsung_tty part of the report; the other four
drivers are separate and I have not touched them.

The analysis holds up against mainline.  Neither s3c64xx_serial_ops nor
apple_s5l_serial_ops has a ->flush_buffer() callback, and
s3c24xx_serial_tx_dma_complete() samples tx_bytes_requested before it
takes the port lock.  A completion that raced with uart_flush_buffer()
therefore advances the freshly reset kfifo by the byte count of the
discarded transfer, and since kfifo_skip_count() does not clamp, ->out
passes ->in and kfifo_len() wraps.

One detail worth adding to the report.  In 29bef7990845, where TX DMA was
introduced, the callback advanced the buffer with

	xmit->tail = (xmit->tail + count) & (UART_XMIT_SIZE - 1);

so an over-advance was masked away and could not wrap.  The wrap only
became possible once the driver moved to the kfifo helpers, which drop
the mask.  That is probably why this never showed up on the older code.

The patch follows the 8250 fix in 9e512eaaf8f4, with one addition.  The
8250 changelog says that clearing the outstanding byte count under the
port lock is sufficient "since the port lock is held when the kfifo is
reset in uart_flush_buffer() and in __dma_tx_complete()".  That holds for
8250 because __dma_tx_complete() reads tx_size inside the lock.  Here the
count is read before the lock, so clearing alone would not help; the
patch also moves the sample under the lock.  The same gap applies to
serial-tegra as reported.

Testing so far:

  - BUILD_RESULT: builds cleanly with gcc 12.3 on x86_64 (COMPILE_TEST,
    CONFIG_SERIAL_SAMSUNG=m, W=1) and with aarch64-linux-gcc 13.3.0 on
    arm64 (arm64 defconfig, which enables ARCH_EXYNOS, ARCH_APPLE and
    SERIAL_SAMSUNG_CONSOLE); no warnings from the new code.
  - BOOT_OR_RUNTIME_RESULT: not booted; I have no Exynos or Apple board.
    Runtime behaviour is covered by the exhaustive interleaving model.
  - the patch applies to mainline at 83f32c773255 with git am;
  - a model of the two actors, with the kfifo semantics taken from
    include/linux/kfifo.h, exhausts every interleaving under the port
    lock: the unpatched callback wraps kfifo_len() in all four flush
    scenarios, the patched one in none, and both agree when no flush
    happens.

I do not have a Linux machine of my own.  The x86_64 build above was run
on a rented Linux server, and the arm64 build was cross-compiled there
with a no-libc aarch64 toolchain; that is as far as I can take testing
without hardware.  There is no Exynos or Apple board available to me, so
the model is what stands in for a runtime reproduction.  If you would
rather have the flush modelled as a KUnit test in the tree, say so and I
will send that instead.

Thanks,
tianci xie


tianci xie (1):
  tty: serial: samsung: fix TX fifo underflow on flush race

 drivers/tty/serial/samsung_tty.c | 40 +++++++++++++++++++++++++++++++-
 1 file changed, 39 insertions(+), 1 deletion(-)

