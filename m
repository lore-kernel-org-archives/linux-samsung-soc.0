From: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH v3 RESEND 2/3] ASoC: samsung: arndale: Add support for
 WM1811 CODEC
Date: Tue, 1 Oct 2019 14:02:11 +0000
Message-ID: <20191001140211.GT10204@ediswmail.ad.cirrus.com>
References: <20191001123625.19370-1-s.nawrocki@samsung.com>
 <CGME20191001123639eucas1p2b15309e0b0008b2627b8630082d69f41@eucas1p2.samsung.com>
 <20191001123625.19370-2-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20191001123625.19370-2-s.nawrocki@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com, sbkim73@samsung.com, patches@opensource.cirrus.com, lgirdwood@gmail.com, krzk@kernel.org, broonie@kernel.org, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, Oct 01, 2019 at 02:36:24PM +0200, Sylwester Nawrocki wrote:
> The Arndale boards come with different types of the audio daughter
> board.  In order to support the WM1811 one we add new definition of
> an ASoC card which will be registered when the driver matches on
> "samsung,arndale-wm1811" compatible.  There is no runtime detection of
> the audio daughter board type at the moment, compatible string of the
> audio card needs to be adjusted in DT, e.g. by the bootloader,
> depending on actual audio board (CODEC) used.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
