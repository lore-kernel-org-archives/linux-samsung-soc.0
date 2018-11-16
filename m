From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 9/9] ARM: EXYNOS: remove <mach/map.h> include
Date: Fri, 16 Nov 2018 13:49:24 +0100
Message-ID: <CAJKOXPco4yCmCH=RC3Kdoo-x1UPFj2GeGDp6Eb0zZ-DkNg013w@mail.gmail.com>
References: <CGME20181115151247epcas2p4053da2cb28b2414156d2fd0530059c0d@epcas2p4.samsung.com>
 <1542294698-17470-1-git-send-email-b.zolnierkie@samsung.com> <1542294698-17470-10-git-send-email-b.zolnierkie@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1542294698-17470-10-git-send-email-b.zolnierkie@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie@samsung.com>
Cc: arnd@arndb.de, Marek Szyprowski <m.szyprowski@samsung.com>, kgene@kernel.org, m.reichl@fivetechno.de, Andrzej Hajda <a.hajda@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, javierm@redhat.com, pankaj.dubey@samsung.com, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, 15 Nov 2018 at 16:12, Bartlomiej Zolnierkiewicz
<b.zolnierkie@samsung.com> wrote:
>
> Remove no longer needed <mach/map.h> include.

If I understand correctly, header is not needed because of previous
commit so it should be squashed there.

Best regards,
Krzysztof
