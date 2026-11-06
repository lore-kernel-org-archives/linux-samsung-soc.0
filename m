Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793971067;
	b=4QL/n2PS3af1rpJvMCKgasmc0ZiTxVQSXcgLU/1ofYhQ43uy9HKc31EQBmMcYlmA3yQG
	 /LrLBGSc4j+xuyxNGbnvnXF9bm1qBmgugZ8hM0kmOdVe6X/brTcpCe66HZvbLUmWjaWHj
	 5EexHpv13IpPOufWgYIeWA9uA/Aad2HRagPFbqOBeXdH072LeZE9nor+m8eqJdQwk/WDj
	 LmX/putXWP6HYZpAQ3QXc5tXUFHawkuJYFlbjgDP3GJiPri44JLhUMCzbuu7x0AtB4zXx
	 btHg/wHqLX43r2Zcb6Ti8B0mld0wCeef8OdqlhzIa4YM4NuzZFYE+z6BKfj3JIm9QVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793971067;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qTHbu26SmZE0KzIOkVAH3K1IFltQRurB0XBnFky6Png=;
	b=ovjZVsj/lI8uldiXTz34gfucHQPkCD/9b/tvSmLmsNBxjpWJhNDGyZkH6DvXUYgkFcGv
	 yz7fWPNOelljkQHTRTcz84VuFHTTVlxy8W2pz1ZOwPQAnRxhtYQxnqY+14c7wljsB2kAV
	 JMCfSC0I4w90NuYb526DhO0Ls7h5M36SbKMnLtVY9xLXt8KSgO9qlP7fF84hsqo+wtmjD
	 U4gQ/oii7YD6guuMHo6f2p49YgTQc7x9S55eYnMRfN7xVmeWOFQZlrSZTZ19tUoegS18S
	 ygV/dn89NVSoq74k+rqvziMrLuVkAAidkdo+XTdNkeCMS9UJ3JvXrbEshgX3REDPaMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jA2+1bvm;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5087A606A329
	for <linux-samsung-soc@vger.kernel.org>; Fri,  6 Nov 2026 13:17:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5087A606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jA2+1bvm
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3ada8bc2380so337022a91.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 Nov 2026 05:17:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793971066; x=1794575866; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qTHbu26SmZE0KzIOkVAH3K1IFltQRurB0XBnFky6Png=;
        b=jA2+1bvmeH1iA6yQhRmvZWP2gCoIeTK1eJDFDe5n9MLxbJVJ3+EX1Q4sdDAgRzP99E
         uinZGKuy9BfIV1VNzjwdSouiUqkfrDBPh8OA6MzeaqNfNBFmiUO9yGudCMBvDY2aSam8
         yckYW9t8q/ThU8K/DuTYO5/Kx8d+rk1LWrVtMANd6be336d1gq0nH64q0vekrg8YBkxS
         uT2Rk7/DrHoPrQjyUJjQ5OOFDFGnRWEyT7Dyi8NsnQNcgCWRkkjoruPH/ewxFLbP683g
         DBk2X5GEnmloQiyUuuWSMI6RVCltEkgcmnkwjHEIaG7V/9oCVWfzUSIVKEgbySuMbBJ9
         5PPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793971066; x=1794575866;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qTHbu26SmZE0KzIOkVAH3K1IFltQRurB0XBnFky6Png=;
        b=rNGot26dvkr2Kyr3P67QplmI+A5T1tL2VG82groQny62jCuVRBep7BGinQwwl7hWeS
         xwg4APf+V/HAqZJZrpMD+tlLH3F9Oan6XOL/0dtMSd1Kz5tkXmNo9K+PzEC3xcEwsMtd
         7IcDM9AEk+YNlrupS7XyHB9ogRXe54oZrT6X2TY1O1EkrXZ7ppSawqw8AjqjxmdP/4FB
         rtBmtspXFkDOBuKFRgI5/EipEuQAngcxzioCszP3/wGq6eneZOH5lSpohq8Zpj84JybP
         bxOT7UPjDE39Lfp1LHpOufwgh+NQyGyT0ubIiEuo+nN/Qar264d3GXzunwj7a00XzLs5
         QJiw==
X-Forwarded-Encrypted: i=1; AL+hErHB7eyhjmr2N/z2+5PL2Dub6qb5tjSaYmsFnk56jxcKJESovRv6w94euLcKnqMRXo08k6/DSt6+V/9GGQklZEKJZA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/4AXkoi6ELtJl6M4sYYocrRFcZuVprb7UFhW8MBZTJbSxJV+aO
	rNkwvXz77sU53aZqZI6SaklWnVzmISKnUP68Dt3Q/tQc8VoPrUCyKmNz
X-Gm-Gg: AYBFou3r5Z0RfoliATSiShEinU8ul+xeYPshgfv3C8ahWsfW7Mfy834Q0FQ9bf84tuL
	lPP6hkOrKpIx0lKFxhA4WaGtDO++IdXQ0nq1O8QGGLgqYEaCXvrC9XThEoV1M8WbdTbVEtx2Bo0
	9r+kumlfff6YH1SjK/MjUPEaW/Ih9kdoXJXEiesXMycZiu29auFqkPx4ufUsgupPie7sXMZIcFj
	diiicKovEKCiMqMnzot8eUTia1x2NyHsEkLBjFifrQzjk6lEFQVJEslyxLIavjKuuvrVgmXSxh6
	4KEoc5K+InHOe7hGT3UFbdbCXktsUMF3TwSKo6AqbJ/p8ZUBtMi2badtAE3cAnuZMV8JwOIw8e/
	AZBOBrIvsd6g8vzfxVCiOZ9WTpqmIH2ZXrhzIx+R5nSPbph3I1mEe/QOhCj5V35qM2kKRZNWLH/
	5Ra+Rwr/bEU9Q3TGJH6SHZl9lHeJyq+6I4rvnd6Xvru40vAYodtm3+P89GNA5IUwLyet2ulprjR
	kag0Jp1aACwrQy33Y3ZTpvgFyONNhaAkxjaREKOq7GO8KbzvZmjbThfdokMPfDJagNpE694izEq
	lJ2sNdGhWzP2mdnb64Nspz3gQ4Mpv8i/3NssmNvlfEkEgTiD
X-Received: by 2002:a17:90b:5403:b0:3ac:9463:83e6 with SMTP id 98e67ed59e1d1-3b0db6d710fmr2233907a91.10.1793971065545;
        Fri, 06 Nov 2026 05:17:45 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0e2a8d6fbsm1025636a91.1.2026.11.06.05.17.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 05:17:44 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: MyungJoo Ham <myungjoo.ham@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>
Cc: linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-samsung-soc@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH 0/5] extcon: fix work-vs-devres teardown use-after-free in MUIC/connector drivers
Date: Fri,  6 Nov 2026 22:17:25 +0900
Message-ID: <20261106131730.2633139-1-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Hyunjung Ko <hj351016@gmail.com>

Five extcon drivers register a detect/IRQ work for device-managed
cancellation (devm_work_autocancel() / devm_delayed_work_autocancel())
in their probe function *before* they acquire the resources that the
work handler dereferences -- most importantly the extcon device from
devm_extcon_dev_allocate() / devm_extcon_dev_register(), and for
intel-int3496 also several GPIO descriptors.

devres unwinds in reverse registration order, so on unbind the extcon
device (and the GPIOs) are released first and the work is cancelled
last:

	/* free_irq() */
	devm_extcon_dev_unregister() / extcon freed
	...
	cancel_[delayed_]work_sync(&work);	/* too late */

The work is armed from the IRQ handler (schedule_work() in the MUIC
drivers; queue_delayed_work()/mod_delayed_work() in palmas/int3496), so
an instance can still be pending or running at unbind. When it runs in
the window after the extcon device has been freed but before the work is
cancelled, the handler dereferences freed memory via
extcon_set_state_sync() -> use-after-free. The MUIC drivers' early
"if (!info->edev) return;" guard does not help: info is itself devm
memory freed last, so info->edev is a dangling, non-NULL pointer in that
window rather than NULL.

Each patch fixes one driver by moving the devm work-cancel registration
to *after* the extcon device (and, for int3496, the GPIOs) are acquired
and registered, and still *before* the IRQ that arms the work. Teardown
then runs in the correct order: free IRQ -> drain/cancel work -> free
extcon device. The relocated devm_[delayed_]work_autocancel() still
performs the INIT before the work's first queuing site (the IRQ handler,
requested afterwards), so no queue-before-INIT window is introduced. No
functional change otherwise.

Found by static analysis / code review. None of the five is reproduced
on hardware: each needs its MUIC/PMIC/USB-ID-mux chip and is not
QEMU-reproducible. Treat accordingly.

Hyunjung Ko (5):
  extcon: intel-int3496: drain ID work before its GPIOs and extcon device are freed
  extcon: palmas: drain ID-detect work before the extcon device is freed
  extcon: max8997: drain MUIC IRQ work before extcon device is freed
  extcon: max14577: drain MUIC IRQ work before extcon device is freed
  extcon: max77693: drain MUIC IRQ work before extcon device is freed

 drivers/extcon/extcon-intel-int3496.c |  7 ++++---
 drivers/extcon/extcon-palmas.c        | 12 ++++++------
 drivers/extcon/extcon-max8997.c       | 26 +++++++++++++-------------
 drivers/extcon/extcon-max14577.c      | 28 ++++++++++++++--------------
 drivers/extcon/extcon-max77693.c      | 28 ++++++++++++++--------------
 5 files changed, 51 insertions(+), 50 deletions(-)

--
2.43.0

