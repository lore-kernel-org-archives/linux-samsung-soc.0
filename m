Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793416242;
	b=wEmSHupvRT5+fjG8CYbN7aURBOdIdthzP5NJ1CIgShHP4dThg8MJWjqpaRMSY085i8+B
	 N7w+Co5xFe4e9j6i8Z8N6poErbpK3rkP6g+Rfc6waOYiZV5axnWRy/NAjnrnFwg+H8pQI
	 OGjdTlt0Mz3lIAI7KY+3eyM3AqYapvuPcWL92jOlcpwhDa4+O/8JNlz+/ExJ7URx5iZBx
	 J7Ty0Ek20I8u2E+p+rlZl4EvnjRVIcgebaKnFrn8mq14JLG79eRC66uDFBgFpPgUS3ml6
	 2AS+ZoUadYbQ132Gi7+NWne9xwjIWVLobNz7zqimeTLoXVZBNWDFDf/OBClMUTzBLEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793416242;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=rSQVuufJqG4DagM4PmCmZM1z/EqJK6JLyOoiv3ybUJs=;
	b=GNMI6cRU1xJCtuVGZ6nupCAGDxom2I3BwXu71LUHXPfwV50LuudjuJ0mnDRNUQ/7q0Jt
	 IWyLtkUGaYNlz2vvR6M1CB6RE2x6MdqAMquQrZDl9cISxQ2SK6WxMvIbBjvE69ZFMV5pY
	 XzWYLL/lqr265kDtjCJhPiwrRipkkDHrn4dGrG8Jyf56DQtJPYx0BOSSAIyeMMq6ZZJhU
	 rp9YvT13ZywduV/MENcFL9acjFij/2MuGSHuyVTeHk7Zfe1MgHtWwpqS387RD9Yabm04/
	 LcOcB7ixNWVM0mZV67qggxbFepWBgVc4rc4f+HDU09XBtZTjQBA/vQN9vq6+8FMBPig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=k2coH8XJ;
	arc=none smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C72606A31C
	for <linux-samsung-soc@vger.kernel.org>; Sat, 31 Oct 2026 03:10:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90C72606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=k2coH8XJ
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b1afcd2d23so1754337a12.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 30 Oct 2026 20:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793416240; x=1794021040; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rSQVuufJqG4DagM4PmCmZM1z/EqJK6JLyOoiv3ybUJs=;
        b=k2coH8XJtfESBz3lzKP//K6BfVaUva/cXoE8Zp3cq917UIEhkjwDZl0Q/8Rgvx8+FH
         wi1z7UgntXkBezCAJVDUaswshvR7bVzR6Itoj0fN5I0N1kx6y99QoIZmMobgLdFLl1bv
         d4d+yt9N2bXvx60OAJ9Z9b5+xP/U8umap78ck=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793416240; x=1794021040;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rSQVuufJqG4DagM4PmCmZM1z/EqJK6JLyOoiv3ybUJs=;
        b=ltukS3QNCjdaFf/HmHsDGHglm8AfK/Bu9jQSgZIUo5QfirwEzvaPZgrSpyyl5fWTmp
         K0Yx+f3klMNNl1IdF0TDfEBYoPw7ZydRaCdB9RMhjAcW8mfCBr7YhQBexrpEW2mu5PiG
         v3j13y6U6p0zxli4u2mX4kyuWSPFw7LSDto240SNLNExRekb0dlpU/31yQONd/X1rSHz
         0TBen2FLDDho/PgDSEKYT2DA0HmITR6VgxcXvbRj1oZBmg4g8A7S85n2SUnZs3297ALi
         2YCv3EPZ7XtqBY8hK/zgNqyRZrreGTS4b9ht4WLSNcZKcTI9tz3m3RPTFJIVGiq+ySCP
         B0ZQ==
X-Forwarded-Encrypted: i=1; AKwUvByxpuQBMhWdTgLbOq8KnMiPT7h2mPVwH2z6eMpfZaSpf0Ll1Vavz+bEKxgnSqX2LtNVBmlBvEK8KkyDfqUn4qSJDg==@vger.kernel.org
X-Gm-Message-State: AFq9FYLFB3rS7X3cAJjHuv0ub7lMrNnzl0C+Kpyo7pIX0rkSgLY+9e9A
	moAW/64WLCyckVVapLuGVAJPBo2gc04jB9Y4tajbYeU19VzdUTI/KXGdJ+R2RVnmztSS5+RkdV2
	Q7wjGzU2f
X-Gm-Gg: AYBFou02suDrYvABRcA+bFuU0P4f1hF5pS5/U5RDA7NMvngNPC8P5KQTefOX1BQPSPo
	jehJJnPX427wMp+J3S/R2QSREsZaJ9IspPGo4OEvpru20isp5E9Cjj/u1exY266cBtuOanLqCJw
	VpSKFJcHIxBRhBYc85McqV29ma024z1kxXKgY18jwbwzxn9g8QK95NNdsJXudANRUq+uBBjuj5Y
	auupHYYSnoNR28pgzLb50JKC1M1SJSj4F2gwQbJpcoRCIWlXJh2/I3ZMzJq66ofmhB+lQEP+tID
	SX5q2qCXorW/BcrS75nEwLMyRf65Civy0AfGefO7lwNo7Y3+QgGC+buPckFtKt4G9g63V+kpQv5
	fqYnGeib1cpkIy+fbTnbApC60CGguIWHe4lPPYTKjXoPkagpt9cRgMVE8nUn3BWn1n671NCieCf
	MSJdiZN/3RA+UI/A7ewfNI2Ts8SIwGKrd79S7SEUkiLa1gS+th9+4JhUW6jOMDtg2S9hhozLGa/
	yNls33CAd00E59wBihN72jTn9Uttv0jV1wnTZgeA02ftk210sfgeP8zzxiv6JSjBTXleaH5/Hpc
	fmRxMHa3oJR+x4vhQKdbGqVNEJwo1/BTJ0Cw5iGhHqGbnoHADlQDNDcWEXSElFurCVIQ
X-Received: by 2002:a05:6402:11d3:b0:6af:dc4c:5f28 with SMTP id 4fb4d7f45d1cf-6b4d4f71386mr3143211a12.37.1793416224691;
        Fri, 30 Oct 2026 20:10:24 -0700 (PDT)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com. [209.85.128.46])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4eca0f2a0sm646202a12.25.2026.10.30.20.10.21
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 20:10:23 -0700 (PDT)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so13896115e9.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 30 Oct 2026 20:10:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzVv6KDSLeZWufxI9LCXppYMF2f8vwvHPyrT4UbYi28zMT8/NABfKUW8YQ/i4VUrIqJoX+fk/0xMveXqdwVac6v/A==@vger.kernel.org
X-Received: by 2002:a5d:5f84:0:b0:48d:eec6:308b with SMTP id
 ffacd0b85a97d-48e6e4f561bmr9818154f8f.21.1793416220997; Fri, 30 Oct 2026
 20:10:20 -0700 (PDT)
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020153652.2907186-1-dianders@chromium.org>
 <CAFLszTgzpQ-donjjtcPwy5T3pfWg_u83QMh0GcdpY2JCq_s75w@mail.gmail.com> <CAD=FV=Vt6hgGJuYtv1_mBSQztWQBjmDN9CwLtVxrXcyECGx2-A@mail.gmail.com>
In-Reply-To: <CAD=FV=Vt6hgGJuYtv1_mBSQztWQBjmDN9CwLtVxrXcyECGx2-A@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 30 Oct 2026 20:10:09 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xxn75bf6ZjRPyQ5jfWwxx9cPe8_8bV6qzAXQc+gckB-A@mail.gmail.com>
X-Gm-Features: AclHuK-bghq4wzz1qNlwlR04GGQ-u_3zjoGTgsEW-iZ0A7dRvqdHdSoL4JcYqzo
Message-ID: <CAD=FV=Xxn75bf6ZjRPyQ5jfWwxx9cPe8_8bV6qzAXQc+gckB-A@mail.gmail.com>
Subject: Re: [RFC PATCH 0/7] arm64: Add fit images for sc7180-trogdor and google,lga
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-kbuild@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Chen-Yu Tsai <wenst@chromium.org>, linux-arm-msm@vger.kernel.org, 
	Nicolas Schier <nsc@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Nathan Chancellor <nathan@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Devicetree@vger.kernel.org, 
	Julius Werner <jwerner@chromium.org>, Saravana Kannan <saravanak@kernel.org>, 
	Will Deacon <will@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Alice Ryhl <aliceryhl@google.com>, Andrew Jones <andrew.jones@linux.dev>, 
	Bjorn Andersson <andersson@kernel.org>, Breno Leitao <leitao@debian.org>, 
	David Sterba <dsterba@suse.com>, Gary Guo <gary@garyguo.net>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Luis Augenstein <luis.augenstein@tngtech.com>, 
	Marco Elver <elver@google.com>, Mark Rutland <mark.rutland@arm.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Nick Terrell <terrelln@fb.com>, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, Rong Xu <xur@google.com>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	cros-qcom-dts-watchers@chromium.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Oct 30, 2026 at 6:09=E2=80=AFPM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> > The FIT_ITS path is a second way to build image.fit alongside
> > make_fit.py, and much of it repeats what make_fit.py already does: it
> > puts the root compatible from each DTB into the configuration and
> > compresses the DTBs. The series adds fdtget/fdtput, sed parsing of
> > /incbin/ paths and a shell loop in Makefile.lib to do the same for a
> > hand-written .its file, and the .its files repeat the DTB lists from
> > the Makefiles.
> >
> > Have you thought about extending make_fit.py to take the per-board
> > metadata (e.g. from a small file next to the DTs, or via
> > FIT_EXTRA_ARGS) and to run fdtfactor itself? That would avoid the
> > in-tree fdtget/fdtput, the mkimage dependency and most of the Makefile
> > logic, and trogdor would come almost for free.
>
> I certainly can do that if that's what people want. ...and, yes, I
> think it would simplify some stuff in this patch series. The
> question is: what does it look like? Is it a file that is a list
> of devicetrees along with descriptions? The list of devicetrees
> would be to limit which devicetrees are built into the FIT
> and then each would have a description. ...and yes, that would mean
> it would need to be updated in parallel with the Makefile, but I
> don't see a significantly better way to do it. Yeah, I guess that
> could work OK.
>
> If so, I think a bunch of the patches in this series will be
> dropped or look very different. I probably won't directly reply
> to your comments on patch 2, 4, 6, and 7 if we go this way.
>
> Should I give it a shot for v2?

FWIW, I did a quick prototype of this, and it is definitely a much
smaller / less invasive patch series. I've got
"sc7180-trogdor.fitconfig" and "lga.fitconfig" files. Because they are
easy to parse in python, they're in ".ini" format in my prototype. So
"lga.fitconfig" looks like this:

+# SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
+#
+# Each configuration description encodes board and SoC matching metadata
+# for downstream packaging tools in the format:
+#   "<Model> (<key>=3D<value>,...)"
+# where <key> includes board_id, board_rev, soc_id, and soc_rev with
+# hexadecimal <value>s (in any key order).
+
+[lga-blazer.dtb]
+description =3D Blazer
(board_id=3D0x070406,board_rev=3D0x010000,soc_id=3D0x0005,soc_rev=3D0x01000=
0)
+
+[lga-frankel.dtb]
+description =3D Frankel
(board_id=3D0x070306,board_rev=3D0x010000,soc_id=3D0x0005,soc_rev=3D0x01000=
0)
+
+[lga-mustang.dtb]
+description =3D Mustang
(board_id=3D0x070506,board_rev=3D0x010000,soc_id=3D0x0005,soc_rev=3D0x01000=
0)


Happy to post a v2 RFC showing what that looks like if you want...
