Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D1693F1079
	for <linux-samsung-soc@vger.kernel.org>; Sat,  5 Sep 2026 09:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788601633; cv=none; b=FzbsYWrWGs8Qg2r2XfXQy0PpfTaOpymhKWqO4mT125Vj/noMt7Ge8tAtECLvW1U3+mz1S9DyscmA/xtMOtUROd88uzkX2J/t1KZzMVHY2/rmG2yJTz8jLeoTQQAXSRfbygJnL7S7yreyMtel8DKpRDvknHQ344gFQztRg6gbe2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788601633; c=relaxed/simple;
	bh=BaEoG/6SLaF+j+PN5tp7+Wdp37OedR46Vcq2/qxVkD4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=G0PCoDTHEMeI3wOIH8E8j0XQP0ZFT4V2cE2DWAb621Gp+n/QbTtBWdzv+mRjESmxg4+skdfaG5NzyQSpqureaiv2HHXgpCcLigwVs6MNF4TKX+5R6QCpPTxVY9gqfO2mPR2UeMbOEblgAI8a+2Xbk87+yn+wVeQPuo8Ku4Hiyz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sUm8EgSF; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sUm8EgSF"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-485850cbac3so1182482f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Sat, 05 Sep 2026 02:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788601624; x=1789206424; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8I1Jlm5MucKkfjFwaOiA/wi4L8q8pr7cNwUH5XJFU8M=;
        b=sUm8EgSFwuePVR3dg/8YeD3vvUCBHQyHHnli9XsusR7+vKD9DDfKLAcOuqxV//tEjW
         bkQXVykoOZYpgWQtwadrXsG60ZWuob8YKhNQOlMpED8Vk5Wq1OmepQwNLFTYE6mHke91
         PXt43eSDBYW5Qy61QkbR3trMXG79Klg2Ib1TuQT9xyxDyAqdI47TYUvTLLuWntcf0Zx0
         uVOjx9mMgo+mOVdU0gyCodl4l0Q4Visp/sm148NDD5eWQZ9gMf7DoPuhujlRgnfcmHGo
         bPHxEDLBltbFqDE+NBRq7Kz+3RpiAd5tSck4yhiJQmLb/UMVxDlDT2QsPYRPnJCdMr3Y
         QmeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788601624; x=1789206424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8I1Jlm5MucKkfjFwaOiA/wi4L8q8pr7cNwUH5XJFU8M=;
        b=ZSV5dYwlaCpiGNCqeiE3OAvWgzRyyeAPqK5c8dg2cCl79j+e/71skP2Jt4d5rKpXVg
         S9cpZlG6qvUbR8EyFshhUsjwr4H3f9UN5kdu6eu9ftPwKoDRlaAwsQtH5ATKkOIdO7Km
         KVccyGiATlCjSyXjXwnfo8987IeHEqDHUA22RWz6yT1b17YyL1/wquKYXbd6zOaxL3Po
         0eVXTWeFc24Jb2AlETjfpwD6Bad/UHt/hxVx/k0sVFZRsSgK/7679Sy1ZsuiCQ7MVp3m
         YdDzq78U8jIut8DE+TTbsvDBEiFRXJ+CS5LNVMIY0A6O6HLnyPYgrIzsnFd1gFMmOUoe
         gFwg==
X-Forwarded-Encrypted: i=1; AKwUvByQytAblZABfdWj041RyhZFo63YyQMdJOVtp1KSB+9jxwqiwbvw9D+6Vrxonnn4nxXye1/rXy3NuxOder3aIq/ZWA==@vger.kernel.org
X-Gm-Message-State: AFuF++m85m1wq1BlfRhTawPd1wc24O/hjykkkxqeB3I/m5fxqpGGNg2p
	mXKLrGK1o9KKaRfDJWG6lI5nw3TARi67FXzsfP4ITomRPaB94Jv2d+7h
X-Gm-Gg: AYBFou1UaeTafaefuzXmLXaUT+HyzWmFB4Z9gYTSrWdsWN6/jS3WB6pCiSusnF8PJXZ
	OeIn+AAnez6LfUvC3pdjGEFTUA6bmGqDxvMQVmOgQNZzUeN7XYolHNRSEqTqr1Rg/1ny8VXuZzg
	KrFpyiBpt5BuTd31Jr3pAUUhNEbe/MHCBR0QsQhA5KPy8ApNe+Ue8YDVtJJcgVuhkPNHT1QgWfP
	XHKM17N1ZcU3o+xLVB3ScvLFFlgvyinDlU7ASK8YBOJeNwypRdG5HxkZCvosYXxsBWhVqXeRvQ7
	3ekgIUsFNex9sS/kqROZEjSIHpIApSRsjaDPxUY2u3s/Mdlys3vDyk4pm13aAPFehbaRbUtUHTs
	xyZmd+gtDn3GyD8nxe1Be2CaXGAJwyQFCQlrYy8Iy8rZ4/3n9Wc6dnscJGD/nWXK5UBtik8gJT7
	izc4CN6qD1o9KryCTW2E7CIHqGEHq2Crx7rpX3RwxWJK9gRacWaKEhFx8anHtE9gOm2hdm+ouO2
	W/1iguCydUAy6GpjkN+j7AMv+ptqcVuevvv7Sf4PCh3R2KXhVhJE0KfpNO2DcSXryNlNZkSppzp
	KxGYbvDlyH6k4mlfsPJo+7GYWNWs/KOQaIzYON0wamDGP5eSyRU8fMiVCSEQ2co6ikymx9ouB0M
	n4A==
X-Received: by 2002:a05:6000:18a9:b0:485:9211:6560 with SMTP id ffacd0b85a97d-485921165d7mr3155784f8f.25.1788601623937;
        Sat, 05 Sep 2026 02:47:03 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c6ba4sm14232013f8f.25.2026.09.05.02.47.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 02:47:03 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-m68k@lists.linux-m68k.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	Steve Wahl <steve.wahl@hpe.com>,
	Dimitri Sivanich <dimitri.sivanich@hpe.com>,
	Mike Travis <mike.travis@hpe.com>,
	Tony Luck <tony.luck@intel.com>,
	linux-edac@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Tony Lindgren <tony@atomide.com>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-omap@vger.kernel.org,
	Dominik Brodowski <linux@dominikbrodowski.net>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	linux-ide@vger.kernel.org,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Michael Schmitz <schmitzmic@gmail.com>,
	Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v2 2/9] docs: kernel-parameters: Drop the bau= entry
Date: Sat,  5 Sep 2026 11:46:42 +0200
Message-Id: <20260905094649.41996-3-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260905094649.41996-1-kmehltretter@gmail.com>
References: <20260905094649.41996-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bau= went away with commit 39297dde7390 ("x86/platform/uv: Remove UV
BAU TLB Shootdown Handler"); nothing parses it any more.

Drop the entry.

Found by cross-checking every documented name against the __setup(),
early_param() and core_param() registrations in the tree.

Fixes: 39297dde7390 ("x86/platform/uv: Remove UV BAU TLB Shootdown Handler")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index c8d96de4c00d..99d5bb68968a 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -624,13 +624,6 @@ Kernel parameters
 			Format: <int> (must be >=0)
 			Default: 64
 
-	bau=		[X86_UV] Enable the BAU on SGI UV.  The default
-			behavior is to disable the BAU (i.e. bau=0).
-			Format: { "0" | "1" }
-			0 - Disable the BAU.
-			1 - Enable the BAU.
-			unset - Disable the BAU.
-
 	bdev_allow_write_mounted=
 			Format: <bool>
 			Control the ability to open a mounted block device
-- 
2.53.0

