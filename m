Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A81C427F00A
	for <linux-samsung-soc@vger.kernel.org>; Tue, 27 Jan 2026 14:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769522947; cv=none; b=SAw3u4JRs7tDuCj/zbvFUFfVElEWGt6qa8RX1ux2jGIvTS6xqauphxxblFmsGuKuSZzH1NwHQScYkaIDcIpSaFiyL9tfQM5mamPS9uv2Wn63FLmiCfmdah7vKii1xA73wz34WUZsNtq0ooe3mILkhuAl+FbFgX1mO5Y1/+10r2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769522947; c=relaxed/simple;
	bh=9tpzeg8ZLstmijxn+vULudJ7ok11y38DOfncDTdOhvU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Tn53y90IPQOSpTdZpu0qbE6bZBm4WJai5SawV5LsR91p7TNqsH1yYNj5M1TBwvUKITFBNZ7/NidUiJawSnlrVqqNGrNt8qU/3+QwCXQXBL/2L/jjoptzZyCZRlW+nWU1lfWNKMNcF2qNE5Vc0oQkVmW03QnuYnH5YHYRuTvwlXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e0zI5YGx; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e0zI5YGx"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8230c2d3128so2480717b3a.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 27 Jan 2026 06:09:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769522945; x=1770127745; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=HkjARj9793yyLvFYRomWRk5mF/ci3njF8EYRL/lgLi0=;
        b=e0zI5YGxfwU40zakYq9bfEe/otP++w66LixynS2yWtSEhl2autBKl+2DiW7LT2VI+A
         HIVz+7tOZ/UqX9OVIwKxRxTUK+GzIWMGP4hDRAKQgSnUzmojrD8ub5d1Ch8ugqUaR6By
         BCJnNZE1nMTJY6xd92HHzMpM12PAuGiPV31XNieUfEIbhm1azU1+vME2HQ5IHtSOvIW7
         GEvkykFUvg/3ME9VnG7eQnyM4CVOE3n0EW5HLlQXyMX5wMrJXEh9toleCPx4/GQENxwO
         CvONIhgMuFrWxbLdW1aH5tl3RH3BikfhD7YDeK5nkbL4P+5FEfe47h9clawEq08LHW8H
         Mu5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769522945; x=1770127745;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HkjARj9793yyLvFYRomWRk5mF/ci3njF8EYRL/lgLi0=;
        b=BTLGonDFbSUFNwbYAt+QlLWbAbQ/ifyywcmGYSLRvGwjd/fswXwpMctktSVZyIVY+e
         uNX4bpzKJz/U81HwNMO2wlZjfF428BU1xC1O9ExVF8HN2ZrG3kxw9ZGoQiVzqLRnnazs
         cUYnJssFBMsnJfEmuNzAT5/rL0FvwF74FNCD/4dHCg8he5fpcIeisfzt5EOeS9m4eBYE
         J5s44BFTUUjDJtD7q9iKfGgjyXhYWhupT4LfjkiofMygr/1Sat7UmldHOyBvT6S7hAO9
         c37ndh44AEoVw0QocCCERpLsFLlwqlY2/uSfL5lVmqqaFBBPTHCjDre4VimKc9dDq2t1
         O7CQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0CJlH+asZJhPp7KVrkNWsQo8lax8USxWuUQi0nUpSyjFPISz1z+1VdcNJzwuWLRyfOKgc+WxwaPUGzWZqjB+cag==@vger.kernel.org
X-Gm-Message-State: AOJu0YxgIDBZH56EeRAKIZNWrvq5pUF/5ZUzCl5AmnLnI2ZgyxHMWNMy
	wNt+7QYjaBjqXlMD3ci9Q8TYOaQcNSinBKr/0Uqy159+uKCxZ8x/ZLVl18TU81dI
X-Gm-Gg: AZuq6aKZkKD/y4VeKPR1T3hWnZXTN1V1uVFQYjRPYwbLbi3SSuOyjfNuYoiqd2GqCEE
	WnkeNrkc4DMxq2znfLAsSsHp5133p9WVPdsx7uuiuCeJD4T/fyGDa628boPeAgoSM/Pw53ZskRk
	u1uHw+rvAPzycy6i6B6+mtXdmRkJvLJ3gk2k0gdfiPdAQbIR/NoiJNVlB2DExcQoiyXpakHh6kO
	wJFXtFPlbc+CIAnuZvBl6Q3VngItv0WssDcfWagTGLdCKXHlQ4CyzZuPvhee9JECnAPPvrDqW2i
	CJz4hKv0t5iyqRPCj9rmo59R2ZSerfQGc4Xy7XcszVs/8Sl30+rBrqRx6jiwPTUyBu7qsN/qBiO
	QJnlViQIMyKpDMCKUznMKU2kIPuUMJCDpq196PGcrfqUJWMmP2CRRruMUccyuw51NrOdlC/Zki0
	4YtrRWS2u3Y4eJDfMPqaUg/nuRZGMsXeEPYWgiCeOXzRwP7LarYJbyLOkWJju4wikhZw==
X-Received: by 2002:a05:6a00:1d9b:b0:821:a7b6:10a3 with SMTP id d2e1a72fcca58-823692af2a3mr1729625b3a.34.1769522944865;
        Tue, 27 Jan 2026 06:09:04 -0800 (PST)
Received: from daeinki-virtual-machine.localdomain ([58.124.60.88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82318663d82sm12363616b3a.21.2026.01.27.06.09.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 06:09:04 -0800 (PST)
Sender: Inki Dae <daeinki@gmail.com>
From: Inki Dae <inki.dae@samsung.com>
To: airlied@linux.ie,
	daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	linux-samsung-soc@vger.kernel.org
Subject: [GIT PULL] exynos-drm-misc-next
Date: Tue, 27 Jan 2026 23:09:00 +0900
Message-Id: <20260127140900.31856-1-inki.dae@samsung.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Dave and Daniel,

  Just fix the regression introduced by the bridge chain reorder[1].

Please kindly let me know if there is any problem.

[1] commit-id : c9b1150a68d9 ("drm/atomic-helper: Re-order bridge chain ...")

Thanks,
Inki Dae

The following changes since commit bda4b9b8cc2f4850af52fb35abf8ead434ba38dd:

  drm/rcar-du: dsi: Clean up VCLK divider calculation (2026-01-27 12:13:09 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/exynos-drm-misc-next-for-v6.20

for you to fetch changes up to 89f51ab5fa69db4ce2aeec80987befd1a60c6b68:

  drm/bridge: samsung-dsim: Fix init order (2026-01-27 22:48:07 +0900)

----------------------------------------------------------------
Fix one regression
. Fix a regression introduced by the reordered DRM bridge pre-enable/enable
  callbacks. It moves DSI initialization to atomic_enable() so clocks and
  PLL refclk are configured after the display controller is fully set up.
  The DSI is reinitialized if it was previously initialized to ensure
  correct operation when the refclk rate changes.

----------------------------------------------------------------
Tomi Valkeinen (1):
      drm/bridge: samsung-dsim: Fix init order

 drivers/gpu/drm/bridge/samsung-dsim.c | 29 +++++++++++++++++++----------
 1 file changed, 19 insertions(+), 10 deletions(-)
