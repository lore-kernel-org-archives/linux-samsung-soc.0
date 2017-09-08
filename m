From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 2/3] ASoC: samsung: Use 'samsung-i2s' cpu_dai for
 dai_links
Date: Fri, 8 Sep 2017 18:45:12 +0200
Message-ID: <20170908164512.5wwrn2gknfzzb6uy@kozik-lap>
References: <20170906010415.26952-1-jcsing.lee@samsung.com>
 <CGME20170906010417epcas1p2b3460cf27e35e64f5e35fad98f554108@epcas1p2.samsung.com>
 <20170906010415.26952-3-jcsing.lee@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170906010415.26952-3-jcsing.lee@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jaechul Lee <jcsing.lee@samsung.com>
Cc: Sangbeom Kim <sbkim73@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, galaxyra@gmail.com, Chanwoo Choi <cw00.choi@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Sep 06, 2017 at 10:04:14AM +0900, Jaechul Lee wrote:
> Add specific cpu_dai_name to dai_link because samsung i2s driver registers
> two dais and components. Selecting one of them clearly is needed more
> information like cpu_dai_name, of_node. The reason why the dai_links have
> to use 'samsung-i2s' for cpu_dai is that 'samsung-i2s-sec' doesn't have a
> capture functionality.
> 
> Without this code, cpu_dai will be selected the first one of the
> component_list. For example, if I describe nothing to cpu_dai_name,
> 'samsung-i2s-sec' might be selected to HiFi Primay.
> 
> Signed-off-by: Jaechul Lee <jcsing.lee@samsung.com>
> ---
>  sound/soc/samsung/tm2_wm5110.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
