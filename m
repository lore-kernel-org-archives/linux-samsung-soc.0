Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81DDB37885
	for <linux-samsung-soc@vger.kernel.org>; Mon, 18 Dec 2023 14:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CwfmekGU"
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-35f89f18daeso13109405ab.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 18 Dec 2023 06:09:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702908576; x=1703513376; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2QqXSmTnTtT3Od7GmRltkqUPr4ByKUT9ybKktXPVKvg=;
        b=CwfmekGUkzyeJX97NoAfw1ZBZveJosaJsuOA7JOn/0dDLJ2I6JvpwhjNLhCG2CA9yE
         DirIuVMRgm0ACNJ8VQPTVx0j9JlLPjQGLHWL6ntgqHrpzo6tTGgw3cZXlyCIwz2kMcEz
         JVIIuZwTqb9PdjsFOD0bUpwzCI9W07Xw9Njq3zH/RK+fDw34fuhbrqkBoiBIZzCBo2va
         dLjJZYI/KhuVKOxQXM5a0s0p2czUV+ZkeEFzyeN8zbT4qR2R7zTiWpZgLhu3fYWEpNVS
         h7Y8H/OGZvMdlJemwN9SGNryz6waCYQN9jdYvKr2QUQ6DDpwfYr6m7vHlMpiu+X0Qmbk
         6XXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702908576; x=1703513376;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2QqXSmTnTtT3Od7GmRltkqUPr4ByKUT9ybKktXPVKvg=;
        b=VgtEkwrqhdqqlJk38OSqAMg55UpWwNB1S2P4duCTVV4vzUJHb4DVDMKniPuXkfbghK
         sw+gyvYlgR8OxTV44fFWbyVYqhSRmbuSE0xbooa7/feNONyYUygS/lymlKpqf5LPXnK2
         DE4jTGFJaj2XajIEzegPytBGekCSQUbJdSegCQAxsx50xey5A2IRblB/v9WydQrsPIjf
         8yl5Ml0wbJ10BG8My/LKhexQgP9Jq7y/7zo6lHHqWmPUgutgJmj9ua4dUTma7HsZ0fu5
         4aQZmSUBqaZuKoMyiCkhfJ7DSNpl2VYFO7jDeqaHwHPTKWIb1mDW70p09s7Vye5WRlxJ
         ktbg==
X-Gm-Message-State: AOJu0YxYQsBYZ4Hju5n+S1SRQ2sMmklKzwlYjFZ5LZdT6cpRUdYYiRy6
	nTbqqlNJQmRRP82J9mt2d8+gKwUZYFCmXCIVcYpBdg==
X-Google-Smtp-Source: AGHT+IFYjruUvqVZXDvbXT4LNhRX+qeEr6xvnJELdCnoTBR7EBrvWnDtSE1Zyb2YKZ0Fu9zHGj9ZHRrOE2/7mu+2rhs=
X-Received: by 2002:a05:6e02:194f:b0:35d:5553:7427 with SMTP id
 x15-20020a056e02194f00b0035d55537427mr21641253ilu.8.1702908576714; Mon, 18
 Dec 2023 06:09:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231218094548.37105-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20231218094548.37105-1-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 18 Dec 2023 15:09:25 +0100
Message-ID: <CACRpkdZwRJ1U8n=HP8TzqNVK4J5RqhiJYBdH0COexMH7TyDknw@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: samsung: drivers for v6.8
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Sylwester Nawrocki <snawrocki@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 18, 2023 at 10:45=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> Google and Samsung SoC pinctrl changes for v6.8.

Pulled in to my "devel" branch for V6.8!

Excellent work as always, thanks for keeping the Samsung Exynos in order,
there are so many users of this SoC now that without your coordination
it would be complete chaos.

Yours,
Linus Walleij
