From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 2/2] ASoC: samsung: i2s: Fix multiple
 "IIS multi" devices initialization
Date: Tue, 19 Feb 2019 16:42:17 +0100
Message-ID: <CAJKOXPfnOTvNQmx-ayYLXzJ9ViAv=m5rpzvLnOmaXWZLuMJ-Uw@mail.gmail.com>
References: <CGME20190219152015epcas2p455d8fc3fa012de0f1e857b0b2c88f773@epcas2p4.samsung.com>
 <20190219151941.9795-1-s.nawrocki@samsung.com>
 <20190219151941.9795-2-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <20190219151941.9795-2-s.nawrocki@samsung.com>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: alsa-devel@alsa-project.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie@samsung.com>, sbkim73@samsung.com, lgirdwood@gmail.com, linux-kernel@vger.kernel.org, broonie@kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, 19 Feb 2019 at 16:20, Sylwester Nawrocki <s.nawrocki@samsung.com> wrote:
>
> On some SoCs (e.g. Exynos5433) there are multiple "IIS multi audio
> interfaces" and the driver will try to register there multiple times
> same platform device for the secondary FIFO, which of course fails
> miserably.  To fix this we derive the secondary platform device name
> from the primary device name. The secondary device name will now
> be <primary_dev_name>-sec instead of fixed "samsung-i2s-sec".
>
> The fixed platform_device_id table entry is removed as the secondary
> device name is now dynamic and device/driver matching is done through
> driver_override.
>
> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Suggested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
> Changes since v1:
>  - fixed pdev->driver_override assignment,
>  - ensure there is no need to release any resources claimed
>    in i2s_create_secondary_device() function when that function fails.
> ---
>  sound/soc/samsung/i2s.c    | 50 +++++++++++++++++++++++++-------------
>  sound/soc/samsung/odroid.c |  2 +-
>  2 files changed, 34 insertions(+), 18 deletions(-)

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
