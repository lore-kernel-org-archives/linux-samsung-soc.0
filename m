From: ayaka <ayaka@soulik.info>
Subject: Re: [RFC PATCH v3 2/2] drm/panel: Add support for Chunghwa
 CLAA070WP03XG panel
Date: Thu, 22 Dec 2016 22:17:23 +0800
Message-ID: <ee10292d-2939-7664-67db-5879d558c24f@soulik.info>
References: <1474311771-23321-1-git-send-email-ayaka@soulik.info>
 <1474311771-23321-3-git-send-email-ayaka@soulik.info>
 <20161206154625.GA28534@ulmo.ba.sec>
 <2C9FE0C5-F521-48CD-B274-66128312CA75@soulik.info>
 <20161207145555.kdg7azcrpnwnb2r6@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161207145555.kdg7azcrpnwnb2r6@phenom.ffwll.local>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux@armlinux.org.uk, krzk@kernel.org, linux-kernel@vger.kernel.org, kgene@kernel.org, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org



On 12/07/2016 10:55 PM, Daniel Vetter wrote:
> On Wed, Dec 07, 2016 at 08:57:23AM +0800, Ayaka wrote:
>>
>> 從我的 iPad 傳送
>>
>>> Thierry Reding <thierry.reding@gmail.com> 於 2016年12月6日 下午11:46 寫道：
>>>
>>>> On Tue, Sep 20, 2016 at 03:02:51AM +0800, Randy Li wrote:
>>>> The Chunghwa CLAA070WP03XG is a 7" 1280x800 panel, which can be
>>>> supported by the simple panel driver.
>>>>
>>>> Signed-off-by: Randy Li <ayaka@soulik.info>
>>>> ---
>>>> .../display/panel/chunghwa,claa070wp03xg.txt       |  7 ++++++
>>>> drivers/gpu/drm/panel/panel-simple.c               | 27 ++++++++++++++++++++++
>>>> 2 files changed, 34 insertions(+)
>>>> create mode 100644 Documentation/devicetree/bindings/display/panel/chunghwa,claa070wp03xg.txt
>>> Applied, thanks.
>> Wait, it is RFC, not pass the test.
> Well 2 months of silence, it's reasonable to assume that this works for
> you ... I guess you need to supply a fixup patch asap ;-)
Sorry, my exynos 4412 board is broken, I will order one and fix this 
problem, please don't merge this patch until somebody confirm that it is 
adjusted to correct parameter.
> -Daniel
