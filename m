Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0530625FA3B
	for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Nov 2025 03:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763436676; cv=none; b=nGR03qJGe/tSoCr2nMWUnARVTsTY7BF72+XwSGvADwqSECckJIaDVCXOTRfTj6ljlFvHtRipkM1wNo661Y0Y93TArhsJLFny1UKkXX2fgx+ZBi6ehZlq0ndnypSR8utPe7fmXLrkUsLe6Z4yX57t3sSmROsYPVtq7XPYtU4hp+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763436676; c=relaxed/simple;
	bh=CYBykNBUDaIZWAJXPMDhBYo1XT2xlE7UU7j7DG0nxbA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fOvYOYUwo4r1/xoPEo5kM/zrDdJXC6TCKS5msfUbQ2gRnVpV9bzRyLe/TWPCh2LfcZk3CMaaUdkbS/HjiKyZfD5ukyWvT8Is2TarhSam82vMz5te/iZc1ZHFHQHdPVt3BGKsBKi33wzRwH2/eVbQCCDRA5eVzzTJ5Rhxe85Ojik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=voFXQxAV; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="voFXQxAV"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7c75dd36b1bso1183788a34.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Nov 2025 19:31:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763436673; x=1764041473; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+2VIr7Itu1MVUJ9/b3DX2jYqIGQ+RMtUXX9ci+sIqFU=;
        b=voFXQxAVgv3M+nXaFuoOfyGBu26Ze01ydNcsSyuqZhZMebkD//lNCd2XeRXyZ5+5pv
         RvhJlft/fZQVN9ZieDfLgl+ee2KIcx5KEQIiWIDUVpUSKIciAB36Yr1uEsvSKp22ww9M
         Hlh38ZiwvtcklIQTQVd2onXQs8GC5+V1U7B0OumCGCeWMiRBp0LrBagtUhJYwqGm0JEm
         sFKfkH8XhVOmJLaxSe3kM2PdY8cz60uRsy4+SkdVLGxozfdc8YNMEl3UvLgxTO9SGxEn
         m4RKCZcYtEPIdcZbKUMeXHdMjzzA4SYDIkJoT+duI8hHsG3hU4cW14F8yKeQFwdpoWIK
         UjYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763436673; x=1764041473;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+2VIr7Itu1MVUJ9/b3DX2jYqIGQ+RMtUXX9ci+sIqFU=;
        b=W6At41AHrhAGloUM+H/rOyGvamPtoZloHlFPQmjPJTy1o1ntpAzTJeTWYjb1vvkFzg
         xxoenF2K8LltfwfR+AzlZ/CI2LUFQx6rKAv1fg/TPkVFUCGVPaoV0y4lgmCPrd52L1zT
         xIWmp2zCA3/L+DiFrRIJHKmoF8G4NjUFExFH8B427f38tnLCZueopbd4Dvy2a4LPpRRi
         OW42ai7E85Pf95CQYPqbdeFXRlJljsagsI/erOquNz8Un+tKdEnG0chmxuHzVsUsPp91
         zjmXma2c0y/q+TOYTCx8mx6WjMCGnYXYHjBExLwWmyiAWavFSMC9IZNYJKRvQHHYo0cp
         bp1g==
X-Forwarded-Encrypted: i=1; AJvYcCVtVZUaTj7KOQs5WGkI82DzZcA2ame265PD/zz2jtqkIyRPwJwFSH3f4D6WGDFx5WoJ6GN8yv+uBAlu17snM54t1A==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc4VG6lzK+PgQ1QCPyAfyXPRgdc8ogcYVY/zk0bA6cFpXAEGU0
	7H8SMh9FoLKrs9MVoqCeMPZZnhXxqybDymmEo2oCWuT8xo9lvIdq7zOMN6gFcliIIug=
X-Gm-Gg: ASbGncsSrr9xay0g/BPbyMeQwPCvJWyfaV3Bdiacl8WBsgBIBUEMHMVwmpEI5jcXrJA
	+j626nr69RaoHCxpmoXOwZ1CsgyZtvkHIuKMusIW0q1J9HJpblKEA1CQGkTngw7t6VxWNLXxDPk
	jaSN5Mbqq8FDXEuI00N9cB9zTDx6cVX8Kua1u/h2DetGPaXk6yxSxPJ0H1YnWPI6JUVCE4aMjp7
	s8ghV4odXEagh2CrXIanrnkshCrae6OTBiDnYKIQtnLfK6ytq5iTpLmUHrvgueBv+/ltmzzlxrf
	uzdeI+0hRpePBBG25k+rNhBbzlOSpeCSxd0LBPRY+CDvARtNPSpcI1zkj3JRGSnkJGCXn9YnKuv
	qGi2clnoXGTAHyL0CZ1I7cmP06pbZLtHqtYYl1cLzRLwt9beKlT4SXR/ljd50alu6rdtdLMK15n
	jhfiqsZcm86SDKtj7CpHOgdmiyS9Ultks=
X-Google-Smtp-Source: AGHT+IEMHqQdc1INNBQbtxgj3o3MgrbPaBCaNwlBCSHBEht2hzwf4u6FgeGrcMSM+vy6VZtOTMmvqQ==
X-Received: by 2002:a05:6830:448c:b0:7c7:69c8:2d2 with SMTP id 46e09a7af769-7c769c80f47mr3600708a34.13.1763436673018;
        Mon, 17 Nov 2025 19:31:13 -0800 (PST)
Received: from localhost ([2605:a601:81da:7100:264b:feff:fe59:d7f7])
        by smtp.gmail.com with UTF8SMTPSA id 46e09a7af769-7c759cef21bsm2585506a34.16.2025.11.17.19.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 19:31:12 -0800 (PST)
From: Sam Protsenko <semen.protsenko@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mailmap: Add entry for Sam Protsenko
Date: Mon, 17 Nov 2025 21:31:11 -0600
Message-ID: <20251118033111.23382-1-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use 'Sam Protsenko' as my name consistently in git-shortlog. Also map my
old GlobalLogic email address to my current email to stay reachable.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 .mailmap | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/.mailmap b/.mailmap
index 3a3ba16c2601..9901716af12c 100644
--- a/.mailmap
+++ b/.mailmap
@@ -691,6 +691,8 @@ Sachin Mokashi <sachin.mokashi@intel.com> <sachinx.mokashi@intel.com>
 Sachin P Sant <ssant@in.ibm.com>
 Sai Prakash Ranjan <quic_saipraka@quicinc.com> <saiprakash.ranjan@codeaurora.org>
 Sakari Ailus <sakari.ailus@linux.intel.com> <sakari.ailus@iki.fi>
+Sam Protsenko <semen.protsenko@linaro.org>
+Sam Protsenko <semen.protsenko@linaro.org> <semen.protsenko@globallogic.com>
 Sam Ravnborg <sam@mars.ravnborg.org>
 Sankeerth Billakanti <quic_sbillaka@quicinc.com> <sbillaka@codeaurora.org>
 Santosh Shilimkar <santosh.shilimkar@oracle.org>
-- 
2.47.3

