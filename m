Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF663DAAC3
	for <linux-samsung-soc@vger.kernel.org>; Sat,  5 Sep 2026 07:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788591843; cv=none; b=s9cK5aIlTedhfIzzzAipGuWhS5f8j5y6T9wAmaPEUyT4fg3Zg9PinqPfxbjRCSMLEsYxc+GjL43RrqGvINnvKQjoC6OSAOzzvTt0f+DwPky76YDq0TOMA7rqhXIp/dl9uozLJ17a8n03igKDLPlAf0cXpLz51bRn6yDPzsv63jM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788591843; c=relaxed/simple;
	bh=mhOUqwN3oOeKlzw4AsIblKh3dvC9P48S/odFVVFSApM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UPQ5/dgiv8nB80aLNgQ6/00rCy6z1/5IH0f4JaKmPMd2y1akZJKgJACM2HdzW9dhpXhhZuPKoOmSziEFNdkNuP7tGyAXpShRBC3dDvEGcK2HW5gkPJRr5rj/qZRLE6cdVaY0o0uZjtWabTlHekLEDCCyZcBW8Jw6n+dS+fg120I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rTtTkvs6; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rTtTkvs6"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-485850cf499so1022501f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Sat, 05 Sep 2026 00:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788591837; x=1789196637; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eqbG77xAuC4eDU7XlaYrFKEyC2xRrttTZAEX6ejP9/I=;
        b=rTtTkvs6rM4NMcTBt8xaHA01lBlWiXX3jY40M7exjflP2eSuk0fXtdEIVw962mYre4
         Ppkhcmkyfiy99qBQIutIEDXPYrNbMzpER24nQZGdCVpycjI6q5KVdpUKf7835Z626bmN
         0XYU9d3/pG6cwOndupi0QvQi6RdAnlwn51MBcM8TP+BCx+Oj6nw5Wy1oefcXyYw/RX8U
         PlSdHcYzEtkmipy9uv6trEmsh6UITF6Equj/68D50/aotKv+wmjg3xY5J4LrzFrWl1pv
         4ATLBMbxQZg0lwHvXoZGKMF5rEB138MBB7DThJYARD28T63bmsjfq9M9mDodqWNgAR6p
         vVFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788591837; x=1789196637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eqbG77xAuC4eDU7XlaYrFKEyC2xRrttTZAEX6ejP9/I=;
        b=Hgni32ljjAdILq77SNtTzLnFOY1netUPUmjRkpJC05WZA9565TZDKczBqcNlALrJ+B
         GKoshd0MG6Zt1rSX1WUN36ytf71MJilEF+PUVIQyIQPXtZnWFLvJHOiTyvwCzxa+iGW7
         XgF64Ue5h4xy5DPwQR0qNIaq7JAmY3mfZeXiVLWwvTJ47mnK7vdV2jOEsS1aBufDbLWH
         xIGoikrL0uuafZ4lAQVEq9G7+E+61u+moh+BZoMx8aJ/klWACdw469DzOMjSvbsD3ARM
         P3RQSC5PutyBCb7qqP5cCp1ookvHhyLmsYBCRDlYFWbwdLQbkfNyRF2zMQ5gHXgkm5lV
         8jIg==
X-Forwarded-Encrypted: i=1; AKwUvByjD+t3u1koE4DsFksKhQqiEq6HinEbJKavJcFXjCk7BHX8EweLSKJLqBD9nrpQjzXGYayoZer/t9q+1HC+nyQkyg==@vger.kernel.org
X-Gm-Message-State: AFuF++loxBHbzYg8UtieoQAvho6elK70mhH7to3lg6aQW3/aiU8tQzNe
	riuYLmjxD2l6y02BBJ+1HklwKPw/xaN1QnpNpw+DBx+wyw1+KWdMOblM
X-Gm-Gg: AYBFou3x5YR4rfJ4f4uYMl8XeiCr6k2NpReogGmWUXGR+5mw7iHTpYBSJEy1qR8qnZt
	1uRyJzNsVH5D5pTSVCUhGl6+zLOLqbs76/XaPcIYuU2U7WfVYmW65EdrAiUACrA/Peli/bj3rnw
	LI64Tcc7hWCr71PwsMk+c61rsr6kArlsEEGbAh7BUWhPbhoIPKUbgatCmd+j9PnyhgMt91WITbx
	DjY18NTatmPeRSA9gGDA7PIKgXVbp003EmeBwlypG0SPWZt+1xgbU74+AuPDbsYjj7Mn9YINMKr
	Iza31wFPIUEoKQeMdw42nvrjZYNoGU4SxL6S578k2hPFvIP8HbJpZ2dfPepqQKZdfkS9pknxRjt
	zh4ohcUigkjA18ezBUjtMzptv3upgIg+IyMi6iAmY9+rTozr2zNm8jWMiRwv6W3dRjmDcuXNZCe
	FXUQ8fjiOzPdIB3/xSYfCPYMqtkt8Wmf2Uyo4tA3ujKw54ZQHvwg9OGiC7TXaNWvqhIeOu/KFR6
	em45VphC12kBC6ORVenzI28DOPjLpRcGX6XCemwO7LVayT2Fg77MX5FXTGTwtctP/vI/59T3S0R
	HcL8vXntqnDmt17GjCvyWV3tocFU6QAKO/4VeYfpzskCP5KSFX2ecXh1t9KK3N+xfNWrsWsN
X-Received: by 2002:a05:6000:1a85:b0:485:8c17:9775 with SMTP id ffacd0b85a97d-4858c179a0emr7751270f8f.55.1788591836769;
        Sat, 05 Sep 2026 00:03:56 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfdf6sm12011719f8f.34.2026.09.05.00.03.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 00:03:56 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-m68k@lists.linux-m68k.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	Steve Wahl <steve.wahl@hpe.com>,
	Dimitri Sivanich <dimitri.sivanich@hpe.com>,
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
	linux-ide@vger.kernel.org
Subject: [PATCH 1/9] docs: kernel-parameters: Drop the atarimouse= entry
Date: Sat,  5 Sep 2026 09:03:39 +0200
Message-Id: <20260905070347.25902-2-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260905070347.25902-1-kmehltretter@gmail.com>
References: <20260905070347.25902-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Nothing in the tree parses atarimouse=. drivers/input/mouse/atarimouse.c
only takes a module parameter, and git log -S finds no __setup() for the
boot parameter anywhere in the git history, so the entry has been stale
since before it.

Drop the entry.

Found by cross-checking every documented name against the __setup(),
early_param() and core_param() registrations in the tree.

Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 68647ff4bdd2..c8d96de4c00d 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -591,8 +591,6 @@ Kernel parameters
 
 	ataflop=	[HW,M68k]
 
-	atarimouse=	[HW,MOUSE] Atari Mouse
-
 	atkbd.extra=	[HW] Enable extra LEDs and keys on IBM RapidAccess,
 			EzKey and similar keyboards
 
-- 
2.53.0

